class Comment < ActiveRecord::Base
  belongs_to :post #will need to be polymorphic when photos added
  belongs_to :user
  has_many :likes, :as => :likeable
  validates :content, presence: true


  def liked_by_user?(user)
    self.likes.map { |like| like.user_id }.include?(user.id)
  end
end
