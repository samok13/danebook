class PostsController < ApplicationController

  layout "timeline"
  before_action :require_login, except: [:index]
  before_action :set_author, only: [:destroy]

  def index
    @user = current_user
    @posts = Post.where(user_id: @user.id)
    if signed_in_user?
      @new_post = current_user.posts.build
    end
    @new_comment = Comment.new
  end

  def create
    @post = Post.new(whitelisted_user_params)
    @post.user_id = current_user.id
    if @post.save 
      flash[:success] = "Post has been created!"
    else
      flash[:error] = "Post has NOT been created :("
    end
    redirect_to :back
  end


  def destroy
    @post = Post.find(params[:id])
     if @post.destroy 
      flash[:success] = "Post has been deleted."
    else
      flash[:error] = "Post has NOT been deleted."
    end
    redirect_to :back
  end

  private
  def whitelisted_user_params
    params.require(:post).permit(:body)
  end

  def set_author
    unless @author = current_user.posts.find_by_id(params[:id])
      redirect_to :back
    end
  end
end
