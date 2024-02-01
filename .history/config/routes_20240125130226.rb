Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for JWT-based user sessions

  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users, defaults: { format: :json }, controllers: {
        :sessions =>'api/v1/users/sessions',
        :registrations => 'api/v1/users/registrations'
      }
  
    end
  end
   
end