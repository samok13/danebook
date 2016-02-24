class PhotosController < ApplicationController
  before_action :require_login
  before_action :require_author, only: [:destroy, :show]
  #before_action :require_friend, only: [:show]

  def new
    @photo = Photo.new
  end

  def index
    @photos = Photo.where(user_id: params[:user_id])
    @user = User.find_by_id(params[:user_id])
  end 

  def create
    @photo = Photo.new(photo_params)
    @photo.user = current_user
    if @photo.save
      flash[:notice] = 'Photo was successfully created.'
      redirect_to user_photos_path(current_user)
    else
      flash[:error] = 'Photo was not uploaded.'
      render :action => "new"
    end
  end

  def show
    @photo = Photo.find(params[:id])
    @profile = Profile.find_by_user_id(params[:user_id])
  end

  def serve
    @photo = Photo.find(params[:id])
    send_data(@photo.data,  :type => @photo.mime_type, 
                            :filename => "#{@photo.filename}.jpg",
                            :disposition => "inline")
  end

  def destroy
    @photo = Photo.find_by_user_id(params[:id])
    if @photo.destroy
      flash[:success] = "Photo has been deleted."
      redirect_to user_photos_path(current_user)
    else
      flash[:error]= "Photo was not deleted."
      redirect_to :back
    end
  end


private
  def photo_params
    params.require(:photo).permit(:image)
  end

  def require_friend
    @photo = Photo.find(params[:id])
    unless @photo.user.friends.include?(current_user) 
      redirect_to user_profile_path(@photo.user), alert: "You can't view that image"
    end
  end

end
