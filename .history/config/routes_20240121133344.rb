Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Devise routes for users
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }, path_names: {
        sign_in: 'users/sign_in',
        sign_out: 'users/sign_out'
        # Removed sign_up from here
      }

      # Custom devise_scope for user registration
      devise_scope :user do
        post 'users/sign_up', to: 'api/v1/users/registrations#create', as: 'api_v1_user_registration'
      end

      # ... other routes ...
    end
  end

  # ... other routes ...
end
