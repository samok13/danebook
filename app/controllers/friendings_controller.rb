class FriendingsController < ApplicationController
  def create
    friending_recipient = User.find(params[:friend_id])

    if current_user.friended_users << friending_recipient
      flash[:success] = "Successfully friended #{friending_recipient.name}"
    else
      flash[:error] = "Failed to friend!  Sad :("
    end
    redirect_to :back
  end

  def destroy
     @friending = Friending.where(friend_id: params[:id], friender_id: current_user.id).first

     if !@friending
        @friending = Friending.where(friender_id: params[:id], friend_id: current_user.id).first
      end

     if @friending && @friending.destroy
      flash[:success] = "Successfully unfriended"
     else
      flash[:error] = "You are still friends :/"
     end
     redirect_to :back
  end
end
