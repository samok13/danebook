class ProfilesController < ApplicationController
  before_action :require_login, only: [:edit, :update]
  before_action :profile_owner?, only: [:update]

  def show
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def edit
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def update
    @profile = Profile.find_by_user_id(params[:user_id])
    if @profile.update(whitelisted_user_params)
      flash[:success] = "Updates have been saved."
      redirect_to user_profile_path(@profile.id)
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
      redirect_to user_path(@profile.id)
    end
  end


end
