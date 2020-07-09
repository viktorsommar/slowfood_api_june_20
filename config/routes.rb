Rails.application.routes.draw do
  namespace :api do
    get 'orders/create'
  end
  namespace :api do
    namespace :v1 do
      resources :products, only: [:index], constraints: { format: 'json' }
    end
  end
end