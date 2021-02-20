class SituationsController < ApplicationController
  before_action :set_situation, only:[:show, :destroy]
  before_action :authenticate_user!, only:[:new, :create, :destroy]
  before_action :ensure_current_user_and_situation, only:[:destroy]
  before_action :set_search, only:[:show, :search]

  def index
    @situations = Situation.all.sort_created_at.page(params[:page]).per(10)
  end

  def new
    @situation = Situation.new
  end

  def create
    @situation = current_user.situations.create(situation_params)
    if @situation.save
      redirect_to situations_path, notice: "お題を作成しました。"
    else
      render :new
    end
  end

  def show
    @tsukkomis = @situation.tsukkomis.sort_created_at.page(params[:page]).per(10)
  end

  def destroy
    @situation.destroy
    redirect_to situations_path, alert: "お題を削除しました。"
  end

  def thousand_fungo
    @situation = Situation.order("RANDOM()").first
    @tsukkomis = @situation.tsukkomis.limit(10)
    flash.now[:notice] = "最新のツッコミ#{@tsukkomis.count}件を表示しています"
  end

  def search
    @results = @search.result.page(params[:page]).per(10)
  end

  private

  def situation_params
    params.require(:situation).permit(:title)
  end

  def set_situation
    @situation = Situation.find(params[:id])
  end

  def set_search
    @situation = Situation.find(params[:id])
    @search = @situation.tsukkomis.ransack(params[:q])
  end
end
