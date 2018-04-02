# This is the ApplicationController class
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def update_without_password(params, *options)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: %i[first_name last_name food_truck_name phone_number
                         city state url description]
    )
    devise_parameter_sanitizer.permit(
      :account_update, keys: %i[first_name last_name food_truck_name
                                phone_number city state url description]
    )
  end
end
