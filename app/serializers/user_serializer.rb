# User Serializer
class UserSerializer < ActiveModel::Serializer
  attributes :id, :location, :city, :state, :food_truck_name, :url, :description
end
