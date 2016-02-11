class UsersController < ApplicationController

  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  #before_action :authorize, only: [:edit, :update, :destroy]
  # before_action :authenticate, except: [:index, :show]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(whitelisted_user_params)

 
      if @user.save
        sign_in(@user)
        flash[:success] = 'User was successfully created.'
        redirect_to @user
      else
        flash[:error] = 'User was not created.'
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(whitelisted_user_params)
        sign_out
        redirect_to @user, 
        flash[:notice] = 'User was successfully updated.'
      else
       render :edit
       flash[:error] = 'User was not updated.'

      end
    end
  end

  def destroy
    sign_out
    flash[:notice] = 'You have successfully signed out.'
    redirect_to users_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.

  def whitelisted_user_params
    params.
      require(:user).
      permit( :name,
              :email,
              :password,
              :password_confirmation,
              ...)
end
