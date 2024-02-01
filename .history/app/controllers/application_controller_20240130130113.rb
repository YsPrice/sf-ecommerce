class ApplicationController < ActionController::Base
        # include DeviseTokenAuth::Concerns::SetUserByToken
        before_action :log_request_headers
    def test_route
        render plain: 'Test Route Accessed'
      end
end
