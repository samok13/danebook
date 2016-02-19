class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  
  def require_login
    unless signed_in_user?
      flash[:error] = "Not authorized, please sign in!"
      redirect_to login_path  #< Remember this is a custom route
    end
  end

  def require_logout
    if signed_in_user?
      redirect_to users_path
      #Should ideally not be subclasses of app_controller
    end
  end

  def current_user
    @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end
  helper_method :current_user

  def require_current_user
    # don't forget that params is a string!!!
    unless params[:id] == current_user.id.to_s
      flash[:error] = "You're not authorized to view this"
      redirect_to root_path
    end
  end 

  def sign_in(user)
    user.regenerate_auth_token
    cookies[:auth_token] = user.auth_token
    @current_user = user
  end
  helper_method :sign_in

  def permanent_sign_in(user)
    user.regenerate_auth_token
    cookies.permanent[:auth_token] = user.auth_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:auth_token)
  end

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_author
    if User.find(params[:user_id]) != current_user
      flash[:error] = "You're not authorized to view this"
      redirect_to :back
    end
  end
  helper_method :require_author

end
