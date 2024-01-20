module Api
    module V1
      module Users
        class RegistrationsController < ApplicationController
          def create
            user = User.new(user_params)
            if user.save
              render json: { message: 'User successfully created!' }, status: :created
            else
              render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
            end
          end
  
          private
  
          def user_params
            params.require(:user).permit(:email, :password, :other_attributes)
            # Replace :other_attributes with actual attribute names
            # If :other_attributes is a hash or array, use:
            # params.require(:user).permit(:email, :password, other_attributes: [])
          end
        end
      end
    end
  end
  