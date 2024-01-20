class ApplicationController < ApiController 
        include DeviseTokenAuth::Concerns::SetUserByToken
    def test_route
        render plain: 'Test Route Accessed'
      end
end
