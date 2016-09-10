class ProfilesController < ApplicationController
  
  

  def set_profile_photo
        
    photo_id = params[:photo_id].to_i
    if photo_id == current_user.profile.profile_photo_id
      flash[:error] = "Already set as cover photo"
    else
      profile = current_user.profile
      
      profile.set_profile_photo(photo_id)
      flash[:success] = "Profile Photo set"
    end
    redirect_to :back
  end

  def set_cover_photo
    
    photo_id = params[:photo_id].to_i
    if photo_id == current_user.profile.cover_photo_id
      flash[:error] = "Already set as cover photo"
    else
      profile = current_user.profile

      profile.set_cover_photo(photo_id)
      flash[:success] = "Cover photo set"
    end
    
    redirect_to :back
  end
end
