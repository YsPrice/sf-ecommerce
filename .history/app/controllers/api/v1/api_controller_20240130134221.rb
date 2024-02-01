module Api
    module V1
        class ApiController < ActionController::API
            
            include DeviseTokenAuth::Concerns::SetUserByToken
            include Devise::Controllers::Helpers
            before_action :authenticate_api_v1_user!
  
            
        end
    end
end