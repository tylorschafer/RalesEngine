Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]
      resources :merchants, only:[:index, :show]
      get 'merchants/most_revenue', to: 'merchants#most_revenue'
    end
  end
end
