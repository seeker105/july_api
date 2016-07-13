class SessionsController < ApplicationController
  # before_action :dropbox_login

  # def new
  #   byebug
  #   connection = Faraday.new(url: "https://www.dropbox.com/oauth2/authorize")
  #   response = connection.get do |req|
  #     req.params['client_id'] = ENV['API_key']
  #     req.params['response_type'] = "token"
  #     req.params['redirect_uri'] = "http://127.0.0.1:3000/auth/dropbox/callback"
  #   end
  #   redirect_to create_session_path
  # end


  def create

    byebug
    # User.from_auth(request.env['omniauth.auth'])
    token = params[:code]
    user = User.first_or_create(token: token)
    session[:user_id] = user.id
    service = DropboxService.new # TODO refactor this
    auth_info = service.get_account_id(token)
    if user.first_name == nil || user.last_name == nil
      User.create(auth_info)
    end
  end

  def destroy
  end

  private
  def service
    @@service ||= DropboxService.new
  end

  def dropbox_login
    byebug
    connection = Faraday.new(url: "https://www.dropbox.com/oauth2/authorize")
    response = connection.get do |req|
      req.params['client_id'] = ENV['API_key']
      req.params['response_type'] = "token"
      req.params['redirect_uri'] = "http://127.0.0.1:3000/auth/dropbox/callback"
    end
  end
end
