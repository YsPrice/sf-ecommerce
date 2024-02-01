Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for JWT-based user sessions

  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, skip: :registrations
      devise_scope :user do
        post 'sign_up', to: 'users/registrations#create'
      end
  
    end
  end
   
end