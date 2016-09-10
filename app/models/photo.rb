class Photo < ActiveRecord::Base
  include DateWriter

  belongs_to :user
  has_many :comments, as: :commentable
  has_many :likes, as: :likeable
  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "212x150" }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/


  def liked_by_user?(user)
    self.likes.map { |like| like.user_id }.include?(user.id)
  end
  
end
