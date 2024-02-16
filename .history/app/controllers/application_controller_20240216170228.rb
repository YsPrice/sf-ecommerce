class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
        include Devise::Controllers::Helpers
        skip_before_action :verify_authenticity_token
    
    def test_route
        render plain: 'Test Route Accessed'
      end
     
end
