Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  resources :users
  resources :sessions
  # Defines the root path route ("/")
  root "users#new"
end
