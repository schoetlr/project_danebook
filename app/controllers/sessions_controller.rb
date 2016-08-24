class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      if params[:remember_me]
        permanent_sign_in(@user)
      else
        sign_in(@user)
      end
      flash[:success] = "Signed in successfully"
      redirect_to user_path(@user)
    else
      flash[:error] = "You couldn't be signed in"
      render :new
    end
    
  end

  def destroy
    sign_out
    flash[:success] = "You were signed out"
    redirect_to login_path
  end
end
