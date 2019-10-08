Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :items do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get 'most_revenue', to: 'most_revenue#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/merchant', to: 'merchant#show'
        get ':id/best_day', to: 'best_day#show'
        get 'random', to: 'random#show'
      end

      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'most_revenue', to: 'most_revenue#index'
        get 'revenue', to: 'revenue#show'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/items', to: 'items#index'
        get ':id/invoices', to: 'invoices#index'
        get ':id/favorite_customer', to: 'favorite_customer#show'
        get 'random', to: 'random#show'
      end

      resources :merchants, only:[:index, :show]

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/favorite_merchant', to: 'favorite_merchant#show'
        get ':id/invoices', to: 'invoices#index'
        get ':id/transactions', to: 'transactions#index'
        get 'random', to: 'random#show'
      end

      resources :customers, only:[:index, :show]

      namespace :invoice_items do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/invoice', to: 'invoice#show'
        get ':id/item', to: 'item#show'
        get 'random', to: 'random#show'
      end

      resources :invoice_items, only:[:index, :show]

      namespace :invoices do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/transactions', to: 'transactions#index'
        get ':id/invoice_items', to: 'invoice_items#index'
        get ':id/items', to: 'items#index'
        get ':id/customer', to: 'customer#show'
        get ':id/merchant', to: 'merchant#show'
        get 'random', to: 'random#show'
      end

      resources :invoices, only:[:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/invoice', to: 'invoice#show'
        get 'random', to: 'random#show'
      end

      resources :transactions, only:[:index, :show]
    end
  end
end
