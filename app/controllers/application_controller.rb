class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :copying?, :source_path, :current_path

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def copying?
    session[:copying] == true
  end

  def source_path
    session[:source_path] ? session[:source_path] : nil
  end

  def current_path
    session[:current_path] ? session[:current_path] : nil
  end
end
