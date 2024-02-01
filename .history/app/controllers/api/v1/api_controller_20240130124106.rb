module Api
    module V1
        class ApiController < ApplicationController
            before_action :authenticate_api_user!
            include DeviseTokenAuth::Concerns::SetUserByToken
  
            
        end
    end
end