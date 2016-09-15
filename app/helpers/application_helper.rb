module ApplicationHelper

  def is_current_user?(user)
    user.id == current_user.id
  end

  #check if the above is needed and ifso change the name
  
  def current(path)
    "active" if current_page?(path)
  end

  def friending_link(user)
    
    if current_page?("/users/#{user.id}/posts") || current_page?("/users/#{user.id}")

      if user.id == current_user.id
        return
      elsif current_user.friends_with?(user)
        link = "<li>#{link_to "Unfriend", friending_path(user.id), method: "delete", id: "friending-link"}</li>"
      else
        link = "<li>#{link_to "Friend", friendings_path(friend_id: user.id),  method: "post", id: "friending_link"}</li>"
      end
      link.html_safe
    end

  end


  def like_display(likeable)
    if likeable.likes.any?
      likes = likeable.likes
      first = likes.first
      first_user = first.user
      remainder = likes.count - 1
      
      if current_user.id == first_user.id
        str = "You and #{pluralize(remainder, "other")} likes this."
      elsif current_user && likes.map { |like| like.user }.include?(current_user)
        str = "You and #{link_to first_user.name, user_path(first_user)}" + " and #{pluralize(remainder, "other")} likes this."
      else
        str = "#{link_to first_user.name, user_path(first_user)}" + " and #{pluralize(remainder, "other")} likes this."
      end
      str.html_safe
    end
  end


end
