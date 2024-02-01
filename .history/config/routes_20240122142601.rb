Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :users do
        match 'api/v1/users/registrations', to: 'devise/registrations#create', via: :post
      end


    end
  end


end
