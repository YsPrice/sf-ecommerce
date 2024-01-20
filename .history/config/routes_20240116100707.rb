Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for Devise sessions and registrations with JWT
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_for :users,
                 defaults: { format: :json },
                 controllers: {
                   sessions: 'api/v1/users/sessions', # Specify the correct path to your SessionsController
                   registrations: 'api/v1/users/registrations' # Specify the correct path to your RegistrationsController
                 }

      # ...
      
      resources :users
      resources :orders
      resources :products, only: [:index]

      resources :orders do
        post 'create_from_cart', on: :collection
      end

      resources :carts do
        resources :cart_items, only: [:create, :update, :destroy]
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
