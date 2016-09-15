class NewsfeedController < ApplicationController
  before_action :require_current_user

  def newsfeed
    @post = Post.new
    @newsfeed = Newsfeed.feed(current_user.id)
    @active_friends = Newsfeed.active_friends_of(current_user)
  end

end
