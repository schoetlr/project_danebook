module ApplicationHelper

  def require_current_user
    if current_user
      @user.id == current_user.id
    else
     false
    end
  end

  def like_display

  end
  
  def current(path)
    "active" if current_page?(path)
  end

  


end
