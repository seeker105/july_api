Rails.application.routes.draw do
  root 'users#index'
  # get 'users/index', to: 'users#index', as: :users

  get 'auth/dropbox_oauth2', as: :dropbox_login
  get 'auth/dropbox_oauth2/callback', to: 'sessions#create', as: :create_session
  # get '1/oauth2/authorize', to: 'sessions#create'


  get 'folders/index', to: 'folders#index', as: :folders_index
  get 'folders/show/:path', to: 'folders#show', as: :folder_show
  get 'folders/copy/start/:source_path/:name', to: 'folders#copy_start', as: :copy_start
  # get 'folders/copy/start/:source_path/:name', to: 'folders#copy_start', as: :copy_start
  get 'folders/copy/finish/:destination_path', to: 'folders#copy_finish', as: :copy_finish
  get 'folders/destroy' #TODO
  get 'folders/create' #TODO
  get 'folders/update' #TODO

  get 'files/index', to: 'files#index', as: :files_index
  get 'files/upload' #TODO
  get 'files/download' #TODO
  get 'files/open' #TODO

end
