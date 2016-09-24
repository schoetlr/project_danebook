class Newsfeed

  def self.feed(user_id)
    user = User.find(user_id)

    content = []
    content.concat(user.posts.to_a)

    user.friends.each do |friend|
      content.concat(friend.posts.to_a)
    end

    content.sort! do |a, b|
      b.created_at <=> a.created_at
    end

    content
  end

  def self.active_friends_of(user)
    user.friends.to_a.select do |friend|
      friend.posts.last.created_at > (Time.now - 7.days)
    end
  end



end