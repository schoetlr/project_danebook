class ProfilesController < ApplicationController

  def set_cover_photo

  end

  def set_profile_photo
    photo_id = params[:photo_id].to_i
    profile = current_user.profile
    
    profile.set_profile_photo(photo_id)

    redirect_to :back
  end

  def set_cover_photo
    photo_id = params[:photo_id].to_i
    profile = current_user.profile

    profile.set_cover_photo(photo_id)

    redirect_to :back
  end
end
