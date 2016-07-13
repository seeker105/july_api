Rails.application.routes.draw do
  root 'users#index'
  get 'users/index', to: 'users#index', as: :users

  # get 'sessions/new', to: 'sessions#new', as: :dropbox_login
  # resources :sessions, only: [:new, :create], as: :dropbox
  # get 'https://www.dropbox.com/oauth2/authorize', as: :dropbox_login
  # get 'sessions/login', to: 'sessions#new', as: :dropbox_login
  # get 'auth/dropbox/login', to: 'sessions#new', as: :dropbox_login
  # get 'oauth2/authorize', as: :dropbox_login
  get 'auth/dropbox_oauth2', as: :dropbox_login
  # get 'auth/dropbox/callback', to: 'sessions#create', as: :create_session
  get 'auth/dropbox_oauth2/callback', to: 'sessions#create', as: :create_session
end
