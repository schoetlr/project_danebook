module ApplicationHelper

  def require_current_user
    @user.id == current_user.id
  end
  
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


end
