Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index], constraints: { format: 'json' }
      resources :orders, only: [:create, :update]
    end
  end
end