Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users 
      # Devise routes for users, excluding registration routes
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions'
      }, skip: [:registrations], path_names: {
        sign_in: 'users/sign_in',
        sign_out: 'users/sign_out'
      }

      # Custom registration route
      post 'users/sign_up', to: 'api/v1/users/registrations#create', as: 'user_registration'

      # ... other routes ...
    end
  end

  # ... other routes ...
end
