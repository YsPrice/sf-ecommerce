module Api
  module V1
    module Users
      class SessionsController < ApplicationController
        def create
     

          if user.persisted?
         
            my_jwt_token = JWT.encode(payload, ENV['DEVISE_JWT_SECRET_KEY'], 'HS256')
            

            response.set_header('Authorization', my_jwt_token)
            
     
            render json: { user: user, token: my_jwt_token }
          else
          
            render json: { error: 'Authentication failed' }, status: :unauthorized
          end
        end


      end
    end
  end
end
