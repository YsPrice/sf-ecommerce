class ApplicationController < ActionController::Base
        include DeviseTokenAuth::Concerns::SetUserByToken
    def test_route
        render plain: 'Test Route Accessed'
      end
      def resource_name
        :user
      end
    
      def resource
        @resource ||= User.new
      end
    
      def devise_mapping
        @devise_mapping ||= Devise.mappings[:user]
      end
end
