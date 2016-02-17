class UsersController < ApplicationController
  before_action :require_login, :except => [:new, :create]
  #skip_before_action :require_login, only: [:new, :create, :index, :show] #josh
  #before_action :require_logout, :only => [:new]
  before_action :require_current_user, :only => [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(whitelisted_user_params)
    if @user.save
      sign_in(@user)
      flash[:success] = 'User was successfully created.'
      redirect_to user_profile_path(@user)
    else
      flash[:error] = 'User was not created.'
      @user.errors.messages
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if current_user.update
      flash[:notice] = 'User was successfully updated.'
      redirect_to user_path(@user)
    else
     flash[:error] = 'User was not updated.'
      render :edit
    end
  end

  def destroy
    if current_user.destroy
      sign_out
      flash[:notice] = 'You have successfully signed out.'
      redirect_to root_url
    else
      redirect_to users_path
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  # def set_user
  #   @user = User.find(params[:id])
  # end

  # Never trust parameters from the scary internet, only allow the white list through.

  def whitelisted_user_params
    params.
      require(:user).
      permit( :email,:password,:password_confirmation, :first_name, :last_name, :birthday, :gender)
  end

end
