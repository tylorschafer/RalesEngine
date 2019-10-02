Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]

      resources :merchants, only:[:index, :show]
      get 'merchants/most_revenue', to: 'merchants/most_revenue#index'

      resources :customers, only:[:index]

      resources :invoices, only:[:index]

      resources :invoice_items, only:[:index]

      resources :transactions, only:[:index]
    end
  end
end
