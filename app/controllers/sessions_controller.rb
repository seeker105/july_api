class SessionsController < ApplicationController


  def create
    if user = User.from_auth(request.env['omniauth.auth'])
      session[:user_id] = user.id
    else
      flash[:danger] = "There was a problem logging in"
    end
    byebug
    redirect_to root_path
  end

  def destroy
  end

end
