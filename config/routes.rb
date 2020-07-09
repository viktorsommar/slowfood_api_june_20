Rails.application.routes.draw do
  namespace :api do
    get 'v1/orders/create'
  end
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index], constraints: { format: 'json' }
      resources :orders, only: [:create]
    end
  end
end