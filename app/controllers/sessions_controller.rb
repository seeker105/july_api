class SessionsController < ApplicationController


  def create
    if user = User.from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
    end
    redirect_to folder_show_path("empty string")
  end

  def destroy
  end

end
