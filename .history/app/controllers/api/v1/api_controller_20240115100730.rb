module Api
    module V1
        class ApiController < ApplicationController
            include DeviseTokenAuth::Concerns::SetUserByToken
            skip_before_action :verify_authenticity_token
        end
    end
end