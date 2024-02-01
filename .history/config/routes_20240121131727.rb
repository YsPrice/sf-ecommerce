Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define routes for JWT-based user sessions
  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'users/sign_in', to: 'users/sessions#create', as: :user_session
      post 'users/sign_up', to: 'users/registrations#create', as: :user_registration
      post '/carts/:cart_id/add_item', to: 'cart_items#add', as: 'add_cart_item'
      delete '/carts/:cart_id/cart_items/:cart_item_id/remove', to: 'cart_items#remove'


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