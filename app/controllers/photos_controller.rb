class PhotosController < ApplicationController
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
end
