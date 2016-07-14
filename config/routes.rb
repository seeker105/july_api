Rails.application.routes.draw do
  root 'users#index'
  get 'users/index', to: 'users#index', as: :users

  get 'auth/dropbox_oauth2', as: :dropbox_login
  get 'auth/dropbox_oauth2/callback', to: 'sessions#create', as: :create_session


  get 'folders/index', to: 'folders#index', as: :folders_index
  get 'folders/show/:path', to: 'folders#show', as: :folder_show #TODO
  get 'folders/destroy' #TODO
  get 'folders/create' #TODO
  get 'folders/update' #TODO

  get 'files/index', to: 'files#index', as: :files_index
  get 'files/upload' #TODO
  get 'files/download' #TODO
  get 'files/open' #TODO

end
