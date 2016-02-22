class SessionsController < ApplicationController
  skip_before_action :require_login, :only => [:create, :new]

  def new
    @user = User.find_by_email(params[:email])
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end

      flash[:success] = "You have successfully signed in"
      redirect_to posts_path(@user)
      
    else
      flash.now[:error] = "We couldn't sign you in"
      redirect_to :back
    end
  end

  def destroy
    sign_out
    flash[:success] = "You have successfully signed out"
    redirect_to root_path
  end
end
