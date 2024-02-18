
        class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
          def create
            @user = User.new(user_params)
            @user.uid = @user.email if @user.uid.blank?
            if @user.save
              @cart = Cart.create(user: @user)
              render json: {user:@user, message:'it worked', cart:@cart}, status: :created

            else
              render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
            end
          end
  
          private
  
          def user_params
            params.require(:user).permit(:email, :password)
          
          end
        end
   
   
  