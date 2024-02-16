Rails.application.routes.draw do


  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # Devise routes for API users
      devise_for :users, defaults: { format: :json }, controllers: {
        sessions: 'api/v1/users/sessions',
        registrations: 'api/v1/users/registrations'
      }


      resources :orders do
        post 'create_from_cart', on: :collection
      end

     
      resources :carts do
        resources :cart_items, only: [:create, :update, :destroy]
      end
      
      post '/carts/:cart_id/add_item', to: 'cart_items#add', as: 'add_cart_item'
      delete '/carts/:cart_id/remove_item', to: 'cart_items#remove', as: 'remove_cart_item'


      resources :products, only: [:index,:show]
      get '/products/:id', to: 'products#show'
      resources :users, only: [:show_all] 
      get 'users/show_all', to: 'users#show_all', as: 'show_all_users'
    end
  end


end
