Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/auth', skip: [:omniauth_callbacks]
  
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :create], constraints: { format: 'json' }
      resources :orders, only: [:create, :update]
    end
  end
end