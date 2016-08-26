module PostsHelper

  def like_link_display(post)
    #<%= link_to "Like", post_likes_path(post.id), method: "POST", class: "col-md-1" %>
    
    if post.liked_by_user?(current_user)
      like = Like.where(user_id: current_user.id).first
      str = link_to("Unlike", like_path(like), method: "DELETE", class: "col-md-1")
    else 
      str = link_to("Like", post_likes_path(post.id), method: "POST", class: "col-md-1")
    end
    str.html_safe
  end

  def who_liked_display(post)
    if post.likes.any?
      likes = post.likes
      first = likes.first
      first_user = first.user
      remainder = likes.count - 1
      
      if current_user.id == first_user.id
        str = "You and #{remainder} others likes this."
      elsif current_user && likes.map { |like| like.user }.include?(current_user)
        str = "You and #{link_to first_user.name, user_path(first_user)}" + " and #{remainder} others likes this."
      else
        str = "#{link_to first_user.name, user_path(first_user)}" + " and #{remainder} others likes this."
      end
      str.html_safe
    end
  end

end
