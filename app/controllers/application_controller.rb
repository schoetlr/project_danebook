class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  private

  def sign_in(user)
    user.regenerate_auth_token
    cookies[:auth_token] = user.auth_token
    @current_user = user
  end

  def permanent_sign_in(user)
    user.regenerate_auth_token
    cookies.permanent[:auth_token] = user.auth_token
    @current_user = user
  end

  def sign_out
    @current_user = nil
    cookies.delete(:auth_token)
  end

  def current_user 
    @current_user ||= User.find_by_auth_token(cookies[:auth_token])
  end
  helper_method :current_user

  def signed_in_user?
    !!current_user
  end
  helper_method :signed_in_user?

  def require_login
    unless signed_in_user?
      flash[:error] = "Need to be logged in"
      redirect_to root_path
    end
  end



  def require_current_user
    unless params[:user_id].to_i == current_user.id
      flash[:error] = "Not signed in"
      redirect_to :back
    end
  end


  def validate_current_user
    unless params[:user_id].to_i == current_user.id
      return false
    end
    true
  end
  helper_method :validate_current_user

  


  
end
