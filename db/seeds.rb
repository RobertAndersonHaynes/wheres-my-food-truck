# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Vendor.delete_all
vendors = []
5.times do |x|
  vendors << Vendor.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    first_name: Faker::Name.first_name.unique.name,
    last_name: Faker::Name.last_name.unique.name,
    phone_number: Faker::Number.number(10),
    city: Faker::Address.city,
    state: Faker::Address.state,
    food_truck_name: Faker::AquaTeenHungerForce.character,
    url: Faker::Internet.url,
    location: Faker::Address.street_address,
    description: Faker::Dune.saying
  )
end
