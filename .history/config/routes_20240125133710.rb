Rails.application.routes.draw do
scope "/users" do
devise_for :users
end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
     

    end
    
  end
#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
# end
