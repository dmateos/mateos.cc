MateosCc::Application.routes.draw do
  devise_for :users
  root :to => 'pages#index'
  get 'contact', to: 'contacts#index'

  resources :contacts
  resources :posts
end
