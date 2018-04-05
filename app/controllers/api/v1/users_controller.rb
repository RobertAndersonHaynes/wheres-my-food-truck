# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < ApplicationController
  def index
    render json: { users: User.all }
  end
end
