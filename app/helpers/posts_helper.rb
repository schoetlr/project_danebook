module PostsHelper

  def like_link_display(post)
    
    if post.liked_by_user?(current_user)
      like = Like.where(user_id: current_user.id).first
      str = link_to("Unlike", like_path(like), method: "DELETE", class: "col-md-1")
    else 
      str = link_to("Like", post_likes_path(post.id), method: "POST", class: "col-md-1")
    end
    str.html_safe
  end

  

  def display_delete_link(post)
    if require_current_user
      str = link_to("Delete", post_path(post), method: "delete", class: "col-md-1 pull-right")

      str.html_safe
    end
  end


  

end
