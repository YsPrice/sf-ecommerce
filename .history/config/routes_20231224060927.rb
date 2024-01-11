Rails.application.routes.draw do
  get '/test_route', to: 'application#test_route'

  devise_for :users, path: 'users', controllers: { sessions: "user/sessions", registrations:  "users/registrations" }
  
  resources :products, only: [:index]

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
