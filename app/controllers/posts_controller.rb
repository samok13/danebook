class PostsController < ApplicationController

  before_action :require_login, except: [:index]
  before_action :require_author, only: [:destroy]

  def index
    @user = User.find_by_id(params[:user_id])
    #@posts = Post.where(user_id: params[:user_id])
    if signed_in_user?
      @new_post = current_user.posts.build
    end
  end

  def create
    @post = Post.new(whitelisted_user_params)
    @post.user_id = current_user.id
    if @post.save 
      flash[:success] = "Post has been created!"
    else
      flash[:error] = "Post has NOT been created :("
    end
    redirect_to user_timeline_path
  end


  def destroy
    @post = Post.find(params[:id])
     if @post.destroy 
      flash[:success] = "Post has been deleted."
    else
      flash[:error] = "Post has NOT been deleted."
    end
    redirect_to user_timeline_path
  end

  private
  def whitelisted_user_params
    params.require(:post).permit(:body)
  end

end
