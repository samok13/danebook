class CommentsController < ApplicationController
  before_action :require_login, only: [:create]
  before_action :set_comment, only:[:destroy]

  def create
    @comment = current_user.comments.build(whitelisted_params)
    if @comment.save
      flash[:success] = "Comment was created."
    else
      flash[:error] = "Comment was not saved"
    end
    redirect_to :back
  end


  def destroy
      if @comment.destroy
        flash[:success] = "Comment was deleted"
      else
        flash[:error] = "Comment was not deleted"
      end
      redirect_to :back
  end

  private
  def whitelisted_params
    params.require(:comment).permit(:body, :commentable_id, :commentable_type)
  end

  def set_comment
    unless @comment = current_user.comments.find_by_id(params[:id])
      redirect_to :back
    end
  end

end
