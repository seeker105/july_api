class SessionsController < ApplicationController


  def create
    if user = User.from_auth(request.env['omniauth.auth'])
      byebug
      session[:user_id] = user.id
    end
    redirect_to folders_index_path
  end

  def destroy
  end

end
