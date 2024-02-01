module Api
    module V1
        class ApiController < ApplicationController
            
            include DeviseTokenAuth::Concerns::SetUserByToken
           include Devise::RegistrationsController
            
        end
    end
end