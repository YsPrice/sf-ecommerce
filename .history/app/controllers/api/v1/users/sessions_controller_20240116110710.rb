module Api
  module V1
    module Users
      class SessionsController < ApplicationController
        def create
          # ... other authentication logic ...
          user = User.find_by(email: params[:email])
if user&.valid_password?(params[:password])
          if user.persisted?
            # Generate a JWT token
            my_jwt_token = JWT.encode(payload, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
            
            # Set the JWT token in the response header
            response.set_header('Authorization', my_jwt_token)
            
            # Return a response (e.g., user data and token)
       
            render json: { user: user, token: my_jwt_token }
          else
            # Handle authentication failure
            render json: { error: 'Authentication failed' }, status: :unauthorized
          end
        else json: {'no user found'}
        end
        end
      end

        # ... other actions ...
      end
    end
  end
end
