class Post < ActiveRecord::Base
  include DateWriter
  
  belongs_to :user
  has_many :likes, as: :likeable
  has_many :comments, as: :commentable

  validates :content, presence: true


  def liked_by_user?(user)
    self.likes.map { |like| like.user_id }.include?(user.id)
  end
end
