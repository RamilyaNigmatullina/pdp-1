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

  root to: "articles#index"
end
