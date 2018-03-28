require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
    first_name 'Bob'
    last_name 'Smith'
    phone_number '8885556666'
    city 'Philly'
    state 'PA'
    food_truck_name 'Food Truck'
    url 'www.foodtruck.com'
    description 'This is my food truck'
  end
end
