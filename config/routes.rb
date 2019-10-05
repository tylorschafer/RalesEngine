Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      namespace :items do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'most_revenue', to: 'most_revenue#index'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
        get ':id/items', to: 'items#index'
      end

      resources :merchants, only:[:index, :show]

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :customers, only:[:index, :show]

      namespace :invoice_items do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :invoice_items, only:[:index, :show]

      namespace :invoices do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :invoices, only:[:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :transactions, only:[:index, :show]
    end
  end
end
