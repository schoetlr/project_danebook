class PhotosController < ApplicationController
  before_action :friends_with_target, only: [:show]
  before_action :be_your_self, only: [:create]

  #make sure you can only create photos for yourself
  def new
    @user = User.find(params[:user_id])
    @photo = @user.photos.build
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.build(photo_params)

    if @photo.save
      flash[:success] = "Photo successfully created"
      redirect_to user_photos_path(@user)
    else
      flash[:error] = "Something went wrong"
      redirect_to :back
    end
  end

  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
  end

  def show
    @photo = Photo.find(params[:id])
    @user = @photo.user
  end

  def edit
  end

  private

  def photo_params
    params.require(:photo).permit(:image)
  end

  def friends_with_target
    
    #put this in a model
    target_user = Photo.find(params[:id]).user
    user_id = target_user.id
    
    unless current_user.friends_with?(user_id)
      flash[:error] = "You are not friends with that user"
      redirect_to user_posts_path(user_id)
    end
  end

  def be_your_self
    unless current_user.id == params[:user_id].to_i
      flash[:error] = "You can't make photos for other people"
      redirect_to user_path(current_user)
    end
  end


end
