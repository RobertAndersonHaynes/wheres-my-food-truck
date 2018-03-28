# This is the controller for the user object
class UsersController < ApplicationController
  before_action :authorize_user, except: [:show]

  def show
    @user = User.find(params[:id])
    if current_user
      if current_user.id == @user.id &&
        current_user.role == ('vendor' || 'admin')
        assign_profile_picture
      else
        flash[:alert] = '***You are receiving this message because your approval
                         status is still pending or you are not an approved
                         vendor.***'
        redirect_to '/'
      end
    else
      flash[:alert] = 'Please sign in to access your account.'
      redirect_to new_user_session_path
    end
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

  def assign_profile_picture
    if @user.profile_pic.nil?
      @profile_pic =
        'https://www.upslopebrewing.com/wp-content/uploads/2017/05/The_Ultimate_Food_Truck_Logo.jpg'
    else
      @profile_pic = @user.profile_pic
    end
  end
end
