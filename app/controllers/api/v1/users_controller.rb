# app/controllers/api/v1/campers_controller.rb
class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end
end
