Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for JWT-based user sessions
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'sessions', to: 'users/sessions#create', as: :user_session
      # You can add more custom routes for user sessions if needed

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
