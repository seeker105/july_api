module ApplicationHelper
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
