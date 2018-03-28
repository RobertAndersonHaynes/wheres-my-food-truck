# This is the User Class model
class User < ApplicationRecord
  validates_presence_of :first_name, :last_name, :phone_number, :city,
                        :food_truck_name, :url, :description, :role

  validates :email, uniqueness: true
  validates :password, length: { in: 6..20 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def vendor?
    role == 'vendor'
  end

  def admin?
    role == 'admin'
  end
end
