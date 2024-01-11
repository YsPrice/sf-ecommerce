class ApplicationController < ActionController::Base
    def test_route
        render plain: 'Test Route Accessed'
        <%= link_to 'Sign Out', destroy_user_session_path, method: :delete %>

      end
end
