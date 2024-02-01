Rails.application.routes.draw do
# scope "/api/v1/users" do
#  devise_for :users, path: '', path_names: {
#   sign_in: 'login',
#   sign_out: 'logout',
#   registration: 'signup'
# },
# controllers: {
#   sessions: 'users/v1/sessions',
#   registrations: 'users/v1/registrations'
# }
# end
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
     

    end
    
  end
end
#   devise_for :admin_users, ActiveAdmin::Devise.config
#   ActiveAdmin.routes(self)
# end
