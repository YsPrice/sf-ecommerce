Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, defaults: { format: :json }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, skip: [:sessions, :registrations]

  namespace :api, defaults: {format: :json } do
    namespace :v1 do
      resources :users
      resources :orders
      resources :products, only: [:index]
      
      resources :orders do
        post 'create_from_cart', on: :collection
      end
      
      
      resources :carts do
        resources :cart_items, only: [:create, :update, :destroy]
      end
      devise_scope :user do
        post 'sign_in', to: 'users/sessions#create', as: :user_session
        delete 'sign_out', to: 'users/sessions#destroy', as: :user_session
      end
    end
  end
end


  




 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  

