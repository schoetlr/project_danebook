class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :edit, :index]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show

  end

  def edit
  end

  def update

  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "User successfully created"
      sign_in(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong"
      render :new
    end

  end

  def destroy
    #sign out
    #destroy the user
  end 

  private

  def whitelisted_params
    params.require(:user).permit(:email, :password, :password_digest)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
