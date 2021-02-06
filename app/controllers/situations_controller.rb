class SituationsController < ApplicationController
  before_action :set_situation, only:[:show, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  def index
    @situations = Situation.all
  end

  def new
    @situation = Situation.new
  end

  def create
    @situation = current_user.situations.create(situation_params)
    if @situation.save
      redirect_to situations_path, notice: "シチュエーションを作成しました。"
    else
      render :new
    end
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
