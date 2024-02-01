class UsersController < ApplicationController
    before_action :set_user, only: [:show,:destroy]
    
    def create 
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show_all
        @users = User.all
        render json: @users
    end
    
    end