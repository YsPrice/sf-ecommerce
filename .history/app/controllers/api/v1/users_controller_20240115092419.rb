module Api
  module V1
class UsersController < ApplicationController

    before_action :set_user, only: [:show, :destroy]

    def create 
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      @user.destroy
      head :no_content
    end
  

  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
    def index
      render json: @user
    end
    def user_params
      params.require(:user).permit(:username, :email, :encrypted_pass)
    end
  end
  
end
end