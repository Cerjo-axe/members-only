Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'newpost', to: 'posts#new', as: 'newpost'
  resources :users
  resources :posts
  resources :sessions
  # Defines the root path route ("/")
  root "posts#index"
end
