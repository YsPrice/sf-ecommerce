class ApplicationController < ActionController::Base
    def test_route
        render plain: 'Test Route Accessed'
      end
end
