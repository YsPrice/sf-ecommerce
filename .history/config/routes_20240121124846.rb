Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Devise routes for users
      devise_for :users, path: '', controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }, path_names: {
        sign_in: 'users/sign_in',
        sign_out: 'users/sign_out'
        # Note: Removed sign_up from here
      }

      # Custom sign_up route using devise_scope
      devise_scope :user do
        post 'users/sign_up', to: 'api/v1/users/registrations#create'
      end

      # ... other api/v1 routes ...

      post '/carts/:cart_id/add_item', to: 'cart_items#add', as: 'add_cart_item'
      delete '/carts/:cart_id/cart_items/:cart_item_id/remove', to: 'cart_items#remove'

      resources :orders
      resources :products, only: [:index]
      resources :orders, only: [:create, :show, :index] do
        post 'create_from_cart', on: :collection
      end

      resources :carts do
        resources :cart_items, only: [:create, :update, :destroy]
      end
    end
  end

  # ... other routes ...
end
