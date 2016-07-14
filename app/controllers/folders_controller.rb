class FoldersController < ApplicationController
  def index
    @folders = Folder.all(current_user)
    # byebug
  end

  def show
    @path = params[:path]
    @folders, @files = Folder.find(current_user, @path)
    # byebug
  end

  def destroy
  end

  def create
  end

  def update
  end
end
