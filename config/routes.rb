Rails.application.routes.draw do
  root to: "pages#index"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"
  get "dashboard" => "users#dashboard"

  resources :users
  resources :articles
end
