module Api
    module V1
      module Users
        class SessionsController < Devise::SessionsController
          def create
            # Find the user by email
            @user = User.find_by(email: params[:email])
  
            if @user&.valid_password?(params[:password])
              if @user.persisted?
                payload = {user_id: @user.id}
                # Generate a JWT token
                my_jwt_token = JWT.encode(payload, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
         
                # Set the JWT token in the response header
                
                # Return a response (e.g., user data and token)
                render json: { user: @user, token: my_jwt_token, cart: @user.cart }, status: :ok
           
              end
            else
              # Handle authentication failure
              render json: { error: 'Authentication failed' }, status: :unauthorized
       
            end
          end
  
          # ... other actions ...
        end
      end
    end
  end