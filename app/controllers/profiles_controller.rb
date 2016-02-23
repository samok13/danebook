class ProfilesController < ApplicationController
  before_action :require_login, only: [:edit, :update]

  def show
    @profile = Profile.find_by_user_id(params[:user_id])
    @user = User.find(params[:user_id])
  end

  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def update
    @profile = Profile.find_by_user_id(current_user.id)
    if @profile.update(whitelisted_profile_params)
      flash[:success] = "Updates have been saved."
      redirect_to user_profile_path(@profile.user)
    else
      flash[:error] = "Unable to update profile."
      render :edit
    end
  end

  private
  def whitelisted_profile_params
    params.require(:profile).permit(:hometown, :lives, :words, :about, :college, :avatar_id, :cover_photo_id)
  end



end
