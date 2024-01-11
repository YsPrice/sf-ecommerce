Rails.application.routes.draw do
  root 'pages#home'
  get '/test_route', to: 'application#test_route'
  get 'home', to: 'pages#home'
  
  resources :products, only: [:index]



  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
