Rails.application.routes.draw do
  root 'users#index'
  get 'users/index', to: 'users#index', as: :users

  get 'auth/dropbox_oauth2', as: :dropbox_login
  get 'auth/dropbox_oauth2/callback', to: 'sessions#create', as: :create_session
end
