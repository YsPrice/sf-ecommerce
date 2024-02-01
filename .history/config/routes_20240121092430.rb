Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  namespace :api, defaults: { format: :json } do
    namespace :v1 do
         devise_for :users, defaults: { format: :json }, path: '', path_names: {
        sign_in: 'users/sign_in', 
        sign_up: 'users/sign_up',
        sign_out: 'users/sign_out'
      }, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }
      post 'users/sign_in', to: 'users/sessions#create', as: :user_session
      post 'users/sign_up', to: 'users/registrations#create', as: :user_registration
      post '/carts/:cart_id/add_item', to: 'cart_items#add', as: 'add_cart_item'
      delete '/carts/:cart_id/cart_items/:cart_item_id/remove', to: 'cart_items#remove'


      # You can add more custom routes for user sessions if needed

      # ...

      resources :users
      resources :orders
      resources :products, only: [:index]

      resources :orders, only: [:create,:show,:index] do
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
