# This is the User Class model
class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :city,
                        :food_truck_name, :url, :description, :role
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def vendor?
    role == 'vendor'
  end

  def admin?
    role == 'admin'
  end

  def update_without_password(params, *options)
    params.delete(:password)
    params.delete(:password_confirmation)

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
