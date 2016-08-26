class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments


  def liked_by_user?(user)
    self.likes.map { |like| like.user.id }.include?(user.id)
  end
end
