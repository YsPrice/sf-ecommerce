Rails.application.routes.draw do
  # devise_for :admin_users, ActiveAdmin::Devise.config
  # ActiveAdmin.routes(self)
  devise_for :users

  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
    
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
