class TimelinesController < ApplicationController
  def show
    @user = User.find_by_id(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    if signed_in_user?
      @new_post = current_user.posts.build
    end
    @new_comment = Comment.new
  end
end
