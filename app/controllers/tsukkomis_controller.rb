class TsukkomisController < ApplicationController
  before_action :set_situation, only:[:new, :create, :show,:edit, :update, :destroy]
  before_action :set_tsukkomi, only:[:show,:edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :edit, :update, :destroy]
  def new
    @tsukkomi = Tsukkomi.new
  end

  def create
    @tsukkomi = @situation.tsukkomis.build(tsukkomi_params)
    if @tsukkomi.save
      redirect_to situation_path(@situation), notice: "ツッコミを登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @tsukkomi.update(tsukkomi_params)
      redirect_to situation_tsukkomi_path(@situation, @tsukkomi), notice: "ツッコミを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @tsukkomi.destroy
    redirect_to situation_path(@situation), notice: "ツッコミを削除しました。"
  end

  private

  def tsukkomi_params
    params.require(:tsukkomi).permit(:phrase, :situation_id)
  end

  def set_situation
    @situation = Situation.find(params[:situation_id])
  end

  def set_tsukkomi
    @tsukkomi = @situation.tsukkomis.find(params[:id])
  end
end