Rails.application.routes.draw do
scope "/api/v1" do
devise_for :users, controllers: {:registrations => "registrations"}
end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
     

    end
    
  end
end
#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
# end
