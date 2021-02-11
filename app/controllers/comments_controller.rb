class CommentsController < ApplicationController
  before_action :set_tsukkomi, only:[:create, :edit, :update, :destroy]
  def create
    @comment = @tsukkomi.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to situation_tsukkomi_path(@comment.tsukkomi.situation_id, @comment.tsukkomi.id), notice: "コメントの投稿に失敗しました。" }
      end
    end
  end

  def edit
    @comment = @tsukkomi.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = "コメント編集中"
      format.js { render :edit }
    end
  end

  def update
    @comment = @tsukkomi.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        flash.now[:notice] = "コメントが編集されました"
        format.js { render :index }
      else
        flash.now[:notice] = "コメントの編集に失敗しました"
        format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました。'
      format.js { render :index }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tsukkomi_id, :situation_id)
  end

  def set_tsukkomi
    @tsukkomi = Tsukkomi.find(params[:tsukkomi_id])
  end
end
