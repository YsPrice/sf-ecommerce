Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        match '/user', to: 'devise/sessions#create', via: :post
      end
      # Devise routes for users
      devise_for :users, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }, path_names: {
        sign_in: 'users/sign_in',
        sign_out: 'users/sign_out',
        sign_up: 'users/sign_up'
      }


    end
  end


end
