module Api
  module V1
    module Users
      class SessionsController < ApplicationController

        def create
          # Use a block to customize behavior within the create method
          user = User.find_by_email(params[:email])

          if user&.valid_password?(params[:password])
            # Here, you can customize what happens upon successful sign-in.
            # For example, you might want to create a JWT token and
            # include it in the response.
            my_jwt_token = create_jwt_token_for(user)
            response.set_header('Authorization', my_jwt_token)
          else
            # Handle unsuccessful sign-in
            render json: { error: 'Invalid credentials' }, status: :unauthorized
          end
        end

        private

        def authenticate_user
          token = request.headers['Authorization']&.split&.last
          if token
            begin 
              decoded_token = JWT.decode(token, 'your_secret_key', true, algorithm: 'HS256')
              @current_user = decoded_token[0]
            rescue JWT::DecodeError
              render josn: {error: 'Invalid token'}, status: :unauthorized
            end
          else
            render json: {error: 'Token missing'}, status: :unauthorized
        
        end
        
      end
    end
    end
  end
end
