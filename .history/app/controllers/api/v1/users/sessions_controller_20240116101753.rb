module Api
  module V1
module Users
  class SessionsController < ApplicationController
    def create
        super do |user|
          if user.persisted?
            # Here, you can customize what happens upon successful sign-in.
            # For example, you might want to create a JWT token and
            # include it in the response.
            my_jwt_token = create_jwt_token_for(user)
            response.set_header('Authorization', my_jwt_token)
          end
        end
      end
      
      private
      
      def create_jwt_token_for(user)
        # Logic to create and return a JWT token for the given user
      end
      
end
end
end
end

