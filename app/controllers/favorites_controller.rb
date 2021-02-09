class FavoritesController < ApplicationController
  def index

  end

  def create
    favorite = current_user.favorites.create(tsukkomi_id: params[:tsukkomi_id])
    redirect_to situations_path, notice: "#{favorite.tsukkomi.user.name}さんのツッコミをお気に入り登録しました。"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to situations_path, notice: "#{favorite.tsukkomi.user.name}さんのツッコミをお気に入り解除しました。"
  end
end
