class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tsukkomis = @user.tsukkomis.sort_created_at.page(params[:page]).per(10)
  end

  def favorite
    @user = User.find(params[:id])
    @favorites = @user.favorites.sort_created_at.page(params[:page]).per(10)
  end
end
