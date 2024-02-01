module Api
    module V1
      module Users
        class RegistrationsController < Devise::RegistrationsController
          def new
            super
          end
        
          def create
            user = User.new(user_params)
            if user.save
              @cart = Cart.create(user: user)
              render json: {user: user, message: 'it worked', cart: @cart }, status: :created

            else
              render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
            end
          end
  
          private
  
          def user_params
            params.require(:user).permit(:email, :password, :other_attributes)
         
          end
          def update
            super
          end
        end
      end
    end
  end
  