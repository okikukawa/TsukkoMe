class CommentsController < ApplicationController
  def create
    @tsukkomi = Tsukkomi.find(params[:tsukkomi_id])
    @comment = @tsukkomi.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        # format.html { redirect_to situation_tsukkomi_path(@comment.tsukkomi.situation_id, @comment.tsukkomi.id) }
        format.js { render :index }
      else
        format.html { redirect_to situation_tsukkomi_path(@comment.tsukkomi.situation_id, @comment.tsukkomi.id), notice: "コメントの投稿に失敗しました。" }
      end
    end
  end

  def edit

  end

  def destroy

  end

  private
  def comment_params
    params.require(:comment).permit(:content, :tsukkomi_id, :situation_id)
  end
end
