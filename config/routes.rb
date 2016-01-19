Rails.application.routes.draw do
  # when using multiple models, controllers will default to the first available
  # devise mapping. routes for subsequent devise mappings will need to defined
  # within a `devise_scope` block

  # define :users as the first devise mapping:
  mount_devise_token_auth_for 'User', at: 'auth'

  # define :admins as the second devise mapping. routes using this class will
  # need to be defined within a devise_scope as shown below
  mount_devise_token_auth_for 'Admin', at: 'admin_auth'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      get     "/contacts",     to: "contacts#index"
      post    "/contacts",     to: "contacts#create"
      get     "/contacts/:id", to: "contacts#show"
      put     "/contacts/:id", to: "contacts#update"
      delete  "/contacts/:id", to: "contacts#destroy"
    end
  end


  # this route will authorize requests using the User class
  get 'demo/members_only', to: 'demo#members_only'

  # routes within this block will authorize requests using the Admin class
  devise_scope :admin do
    get 'demo/admins_only', to: 'demo#admins_only'
  end

end
