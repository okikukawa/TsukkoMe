class TsukkomisController < ApplicationController
  before_action :set_tsukkomi, only:[:show,:edit, :update, :destroy]
  def index
    @situations = Situation.all
    @tsukkomis = Tsukkomi.all
  end

  def new
    @situation = Situation.find(params[:situation_id])
    @tsukkomi = Tsukkomi.new
  end

  def create
    @situation = Situation.find(params[:situation_id])
    @tsukkomi = @situation.tsukkomis.build(tsukkomi_params)
    if @tsukkomi.save
      redirect_to situation_tsukkomis_path, notice: "ツッコミを登録しました。"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @tsukkomi.destroy
    redirect_to tsukkomis_path, notice: "ツッコミを削除しました。"
  end

  private

  def tsukkomi_params
    params.require(:tsukkomi).permit(:phrase, :situation_id)
  end

  def set_tsukkomi
    @tsukkomi = Tsukkkomi.find(params[:id])
  end
end
