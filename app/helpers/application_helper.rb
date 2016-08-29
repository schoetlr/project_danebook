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


  def page_links(user_id)
    if current_page?(controller: "posts", action: "index", id: user_id)
       str = "<li class=\"active\"><%= link_to \"Timeline\", user_posts_path(@user) %></li>
        <li><%= link_to \"About\", user_path(user.id) %>
        </li>
        <li ><a href=\"photos.html\">Photos <span class=\"link-count hidden-xs\">(123)</span></a></li>
        <li><a href=\"friends.html\">Friends <span class=\"link-count hidden-xs\">(542)</span></a></li>."
   # elsif current_page?(controller: "user", action: "show" )
   #    str = "<li><%= link_to "Timeline", user_posts_path(@user) %></li>
   #            <li class="active"><%= link_to "About", user_path(user.id) %>
   #            </li>
   #            <li><a href="photos.html">Photos <span class="link-count hidden-xs">(123)</span></a></li>
   #            <li><a href="friends.html">Friends <span class="link-count hidden-xs">(542)</span></a></li>."
   # elsif current_page?(controller: "static_pages", action: "photos")
   #   str = "<li><%= link_to "Timeline", user_posts_path(@user) %></li>
   #            <li><%= link_to "About", user_path(user.id) %>
   #            </li>
   #            <li class="active"><a href="photos.html">Photos <span class="link-count hidden-xs">(123)</span></a></li>
   #            <li><a href="friends.html">Friends <span class="link-count hidden-xs">(542)</span></a></li>."
   #  elsif current_page?(controller: "static_pages", action: "friends")
   #    str = "<li><%= link_to "Timeline", user_posts_path(@user) %></li>
   #            <li><%= link_to "About", user_path(user.id) %>
   #            </li>
   #            <li><a href="photos.html">Photos <span class="link-count hidden-xs">(123)</span></a></li>
   #            <li class="active"><a href="friends.html">Friends <span class="link-count hidden-xs">(542)</span></a></li>."
     end
     str.html_safe

  end


end
