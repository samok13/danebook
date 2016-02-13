class ProfilesController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :profile_owner?, only: [:update]

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile(whitelisted_user_params)
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(whitelisted_user_params)
      flash[:success] = "Updates have saved."
      redirect_to profile_path(@current_user.id)
    else
      flash[:error] = "Unable to update profile."
      render :edit
    end
  end

  private
  def whitelisted_user_params
    params.require(:profile).permit(:user_id, :hometown, :lives, :words, :about, :number)
  end

  def profile_owner?
    unless Profile.find(params[:id]).user.id == current_user.id
      flash[:error] = "You're not authorized to do this!"
      redirect_to user_path(@current_user.id)
    end
  end


end
