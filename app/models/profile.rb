class Profile < ActiveRecord::Base
  belongs_to :user

  validates :first_name, :last_name, presence: true



  def set_profile_photo(photo_id)
    destroy_profile_photo
    self.profile_photo_id = photo_id
  end

  def set_cover_photo(photo_id)
    destroy_cover_photo
    self.cover_photo_id = photo_id
  end

  private

  def destroy_profile_photo
    self.profile_photo_id = nil
  end

  def destroy_cover_photo
    self.cover_photo_id = nil
  end
end
