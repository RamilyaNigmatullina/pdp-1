Rails.application.routes.draw do
  get "pages/about"

  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles, only: %i(index show)

  namespace :users do
    resources :articles, only: %i(new create edit update destroy) do
      resources :comments, only: %i(create)
    end
  end

  root to: "articles#index"
end
