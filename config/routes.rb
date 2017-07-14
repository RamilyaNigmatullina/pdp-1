Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles, only: %i(index show)

  namespace :users do
    resources :articles, only: %i(new create edit update destroy)
  end

  root to: "articles#index"
end
