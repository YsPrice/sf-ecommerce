Rails.application.routes.draw do
  root 'pages#home'
  get '/test_route', to: 'application#test_route'
  get 'home', to: 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations:'users/registrations'
  }
  resources :products, only: [:index]
  resources :user, only:[] do
    member do
      delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    end
  end


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  
end
