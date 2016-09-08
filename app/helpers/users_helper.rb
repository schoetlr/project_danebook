module UsersHelper

  def friend_button(user)
    if user.id == current_user.id
      button = ""
    elsif current_user.friends_with?(user)
      #link to unfriend
    else
      #link to friend
    end

    button.html_safe
  end
end
