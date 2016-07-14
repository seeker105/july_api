class FoldersController < ApplicationController
  def index
    @folders = Folder.all(current_user)
    # byebug
  end

  def show
    @path = params[:path]
    @path = "" if @path == "empty string"
    @folders, @files = Folder.find(current_user, @path)
  end

  def copy_start
    session[:copying] = true
    session[:copy_start_path] = params[:start_path]
    byebug
  end

end
