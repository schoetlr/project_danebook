class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:show, :edit, :index]

  def new
    @user = User.new
    @user.build_profile
  end

  def index
    @users = User.all
  end

  def show

  end

  def edit
  end

  def update
    if @user.update(whitelisted_params)
      flash[:success] = "User successfully updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong"
      render :edit
    end
  end

  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "User successfully created"
      sign_in(@user) 
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end

  end

  def destroy
    #sign out
    #destroy the user
  end 

  private

  def whitelisted_params
    params.require(:user).permit(:email,
                                 :password, 
                                 :password_confirmation,
                                 { 
                                  :profile_attributes => [
                                  :phone, :birthday,
                                  :college, :hometown,
                                  :current_location, :about,
                                  :words_to_live_by,
                                  :gender,
                                  :first_name,
                                  :last_name ]
                                 }
                                 )
  end

  def set_user
    @user = User.find(params[:id])
  end
end
