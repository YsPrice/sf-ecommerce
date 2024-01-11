Rails.application.routes.draw do
  root 'pages#home'
  get '/test_route', to: 'application#test_route'
  get 'home', to: 'pages#home'
  devise_for :users
  resources :products, only: [:index]
  resources :user, only:[] do
    member do
      delete 'sign_out', to: 'users#sign_out'
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
