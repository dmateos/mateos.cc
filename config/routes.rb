MateosCc::Application.routes.draw do
  devise_for :users
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  root :to => 'pages#index'

  resources :posts
end
