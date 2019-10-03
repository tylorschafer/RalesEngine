Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]

      resources :merchants, only:[:index]

      namespace :merchants do
        get 'most_revenue', to: 'most_revenue#index'
        get 'find', to: 'find#show'
      end

      resources :customers, only:[:index, :show]

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :invoices, only:[:index]

      resources :invoice_items, only:[:index]

      resources :transactions, only:[:index]
    end
  end
end
