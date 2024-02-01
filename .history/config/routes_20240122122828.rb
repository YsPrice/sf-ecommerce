Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'sign_in', to: 'users/sessions#create', as: :user_session
        post 'sign_up', to: 'users/registrations#create', as: :user_registration
        end
    
      resources :products, only: [:index]

    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end


# resources :orders do
#   post 'create_from_cart', on: :collection
# end

# resources :carts do
#   resources :cart_items, only: [:create, :update, :destroy]
# end
