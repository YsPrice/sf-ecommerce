module Api
    module V1
        class ApiController < ApplicationController
            
            include DeviseTokenAuth::Concerns::SetUserByToken
            extend Devise::RegistrationsController
            
        end
    end
end