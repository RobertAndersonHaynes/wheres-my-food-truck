# This is the controller for the user object
class UsersController < ApplicationController
  before_action :authorize_user, except: %i[show update index edit accept
                                            destroy]

  def index
    if current_user.admin?
      @users = User.all
    else
      flash[:notice] = 'You do not have access to this page.'
      redirect_to '/'
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id ||
      current_user.role == 'vendor' || 'admin'
      assign_profile_picture
    else
      flash[:alert] = '***You are receiving this message because your approval
      status is still pending or you are not an approved
      vendor.***'
      redirect_to '/'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.where(current_user.id == :user_id)
    permitted = params.require(:user).permit(:id, :location, :city,
                                             :state, :password)
    updated_user = User.update(params[:id], permitted)
    if updated_user.save
      flash[:notice] = 'Your location has been added sucessfully'
      redirect_to '/'
    else
      redirect_to user_path
    end
  end

  def accept
    @user = User.find(params[:id])
    @user.update_without_password(role: 'vendor')
    flash[:notice] = 'Vendor Aproved'
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = 'Successfully deleted User.'
      redirect_to '/users'
    end
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin? || !current_user.vendor?
      flash[:notice] = 'You do not have access to this page.'
      redirect_to root_path
    end
  end

  private

  def update_without_password(params, *options)
    params.delete(:password)
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  def assign_profile_picture
    if @user.profile_pic.nil?
      @profile_pic =
        'https://www.upslopebrewing.com/wp-content/uploads/2017/05/The_Ultimate_Food_Truck_Logo.jpg'
    else
      @profile_pic = @user.profile_pic
    end
  end

# Never trust parameters from the scary internet, only allow the white list
# through.
  def user_params
    params.permit(:id, :location, :city, :state, :password)
  end
end
