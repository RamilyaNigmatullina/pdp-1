Rails.application.routes.draw do
  get "pages/about"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles, only: %i(index show)
  resource :feedback, only: %i(new create)

  namespace :users do
    resources :articles, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create)
      resources :ratings, only: %i(create)
    end
  end

  resources :orders, only: %i(show new create)
  resources :products, only: %i(index new create)
  resources :warehouses, only: %i(index show new create)

  get "/warehouse/:warehouse_id/products", to: "warehouse/products#index"

  root to: "articles#index"
end
