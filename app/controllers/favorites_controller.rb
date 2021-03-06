class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(tsukkomi_id: params[:tsukkomi_id])
    redirect_to situation_tsukkomi_path(favorite.tsukkomi.situation_id, favorite.tsukkomi.id), notice: "#{favorite.tsukkomi.user.name}さんのツッコミをナイスツッコミ！に追加しました。"
  end

  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to situation_tsukkomi_path(favorite.tsukkomi.situation_id, favorite.tsukkomi.id), notice: "#{favorite.tsukkomi.user.name}さんのツッコミをナイスツッコミ！から削除しました。"
  end
end
