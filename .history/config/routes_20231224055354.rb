Rails.application.routes.draw do
  get '/test_route', to: 'application#test_route'
  devise_scope :user do
  devise_for :users, path: 'users'
  end
  resources :products, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
