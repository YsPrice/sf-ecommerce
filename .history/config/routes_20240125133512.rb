Rails.application.routes.draw do

devise_for :users, :controllers => { :sessions => "api/v1/users/sessions", :registrations => "api/v1/users/registrations"}
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
     

    end
    
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
