class FoldersController < ApplicationController
  def index
    @folders = Folder.all(current_user)
    session[:current_path] = "empty string"
    # byebug
  end

  def show
    @path = params[:path]
    session[:current_path] = @path
    @folders, @files = Folder.find(current_user, @path)
    # byebug
  end

  def copy_start
    session[:copying] = true
    session[:source_path] = params[:source_path]
    session[:source_name] = params[:name]
    redirect_to folder_show_path("empty string")
  end

  def copy_finish
    session[:copying] = false
    source = session[:source_path]
    destination = params[:destination_path]
    name = session[:source_name]
    if destination == "abort copy"
      redirect_to folder_show_path("empty string")
    else
      Folder.copy(current_user, source_path, destination, name)
      redirect_to folder_show_path(path: destination)
    end
    # byebug
  end


end
