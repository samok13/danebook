class PostsController < ApplicationController

  layout "timeline"
  before_action :require_login, except: [:index]
  before_action :require_author, only: [:destroy]

  def index
    puts params
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
    redirect_to posts_path
  end


  def destroy
    @post = Post.find(params[:id])
     if @post.destroy 
      flash[:success] = "Post has been deleted."
    else
      flash[:error] = "Post has NOT been deleted."
    end
    redirect_to posts_path
  end

  private
  def whitelisted_user_params
    params.require(:post).permit(:body)
  end

end
