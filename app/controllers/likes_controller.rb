class LikesController < ApplicationController

  before_action :require_login
  before_action :require_author

def create
    @like = Like.new(whitelisted_like_params)
    @like.user = current_user
    
    if @like.save
      flash[:success] = "Like was recorded."
    else
      flash[:error] = "Like was not recorded."
    end
    redirect_to :back
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      flash[:success] = "Like deleted."
    else
      flash[:error] = "Unable to delete like."
    end
    redirect_to :back
  end


  private
  def whitelisted_like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end

end
