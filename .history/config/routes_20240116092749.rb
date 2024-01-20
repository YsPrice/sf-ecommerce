Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: :json } do
    namespace :v1 do

      devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
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
end


  




 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  

