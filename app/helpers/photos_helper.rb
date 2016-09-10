module PhotosHelper

  def like_link_display_photo(photo)
    
    if photo.liked_by_user?(current_user)
      like = Like.find_by_likeable(photo)
      str = link_to("Unlike", like_path(like), method: "DELETE" )
    else 
      str = link_to("Like", photo_likes_path(photo.id), method: "POST")
    end
    str.html_safe
  end

  def like_link_display_comment(comment)
    
    if comment.liked_by_user?(current_user)
      like = Like.where(user_id: current_user.id).first
      str = link_to("Unlike", like_path(like), method: "DELETE")
    else 
      str = link_to("Like", comment_likes_path(comment.id), method: "POST")
    end
    str.html_safe
  end

end
