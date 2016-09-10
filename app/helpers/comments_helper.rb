module CommentsHelper


  def like_link_display_comment(comment)
    
    if comment.liked_by_user?(current_user)
      like = Like.where(user_id: current_user.id).first
      str = link_to("Unlike", like_path(like), method: "DELETE", class: "col-md-1")
    else 
      str = link_to("Like", comment_likes_path(comment.id), method: "POST", class: "col-md-1")
    end
    str.html_safe
  end


  def display_delete_link_comment(comment)
    if require_current_user
      str = link_to("Delete", comment_path(comment), method: "delete", class: "col-md-1 pull-right")

      str.html_safe
    end
  end
end
