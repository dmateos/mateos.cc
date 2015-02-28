Rails.application.routes.draw do
  root to: "pages#index"

  get "login" => "sessions#new"
  post "login" => "sessions#create"
  get "logout" => "sessions#destroy"

  get "about" => "pages#about"
  get "contact" => "messages#new"

  resources :users
  resources :articles
  resources :messages
end
