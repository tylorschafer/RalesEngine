Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index, :show]

      namespace :merchants do
        get 'most_revenue', to: 'most_revenue#index'
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :merchants, only:[:index, :show]

      namespace :customers do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :customers, only:[:index, :show]

      resources :invoice_items, only:[:index, :show]

      namespace :invoices do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find_all#index'
      end

      resources :invoices, only:[:index, :show]

      namespace :transactions do
        get 'find', to: 'find#show'
        get 'find_all', to: 'find#index'
      end

      resources :transactions, only:[:index, :show]
    end
  end
end
