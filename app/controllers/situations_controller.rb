class SituationsController < ApplicationController
  before_action :set_situation, only:[:show, :destroy]
  def index
    @situation = Situation.all
  end

  def new
    @situation = Situation.new
  end

  def create
    Situation.create(situation_params)
    redirect_to situations_path, notice: "シチュエーションを作成しました。"
  end

  def show
  end

  def destroy
    @situation.destroy
    redirect_to situations_path, notice: "シチュエーションを削除しました。"
  end

  private
  def situation_params
    params.require(:situation).permit(:title)
  end

  def set_situation
    @situation = Situation.find(params[:id])
  end
end
