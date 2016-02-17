class CommentsController < ApplicationController
  before_action :require_login, only: [:create]
  before_action :require_current_user, only: [:destroy]

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
    @comment = current_user.comments.find_by_id(params[:id])
    if @comment.destroy
      flash[:success] = "Comment was deleted"
    else
      flash[:error] = "Comment was not deleted"
    end
    redirect_to :back
  end

  private
  def whitelisted_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

end
