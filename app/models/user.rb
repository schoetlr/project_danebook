class User < ActiveRecord::Base
  before_create :generate_token

  has_secure_password

  validates :password, 
            :length => { in: 6..25 },
            :allow_nil => true

  validates :email, uniqueness: true
  validates :email, presence: true


  has_one :profile
  accepts_nested_attributes_for :profile, 
                                :reject_if => :all_blank, 
                                :allow_destroy => true

  has_many :posts
  has_many :likes
  has_many :photos

  has_many :initiated_friendings, foreign_key: :friender_id,
                                  class_name: "Friending"

  has_many :friended_users, through: :initiated_friendings, 
                            source: :friend_recipient

  has_many :received_friendings, foreign_key: :friend_id,
                                 class_name: "Friending"

  has_many :users_friended_by, through: :received_friendings,
                               source: :friend_initiator
  
  
  def self.search_name(name)
    first_name_search(name).to_a
    .concat(self.last_name_search(name).to_a)
    .uniq

  end

  def cover_photo
    photo_id = self.profile.cover_photo_id
    Photo.find(photo_id) if photo_id
  end

  def profile_photo
    photo_id = self.profile.profile_photo_id
    Photo.find(photo_id) if photo_id
  end

  def has_profile_photo?
    !!self.profile.profile_photo_id
  end

  def has_cover_photo?
    !!self.profile.cover_photo_id
  end

  def friend_count
    friends.count
  end

  def friends
    friended_users
  end

  def friends_with?(user_id)
    if user_id.is_a?(User)
      user_id = user_id.id
    else
      user_id = user_id.to_i
    end
    #for now only true when a user has initiated a friending
    friended_users.pluck(:id).include?(user_id)

  end

  def name
    "#{self.profile.first_name} #{self.profile.last_name}"
  end

  def generate_token
    begin 
      self[:auth_token] = SecureRandom.urlsafe_base64
  
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil

    generate_token
    save!
  end

  private

  def self.first_name_search(name)
    User.select("*")
        .joins("JOIN profiles ON profiles.user_id=users.id")
        .where("first_name LIKE ?", "%#{name}%")
  end

  def self.last_name_search(name)
    User.select("*")
        .joins("JOIN profiles ON profiles.user_id=users.id")
        .where("last_name LIKE ?", "%#{name}%")
  end
end
