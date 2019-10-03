Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]


      resources :merchants, only:[:index]

      get 'merchants/most_revenue', to: 'merchants/most_revenue#index'
      get 'merchants/find', to: 'merchants/find#show'

      resources :customers, only:[:index]

      resources :invoices, only:[:index]

      resources :invoice_items, only:[:index]

      resources :transactions, only:[:index]
    end
  end
end
