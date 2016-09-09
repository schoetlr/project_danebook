class Photo < ActiveRecord::Base

  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300", :thumb => "212x150" }
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
