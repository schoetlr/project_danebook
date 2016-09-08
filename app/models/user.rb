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

  has_many :initiated_friendings, foreign_key: :friender_id,
                                  class_name: "Friending"

  has_many :friended_users, through: :initiated_friendings, 
                            source: :friend_recipient

  has_many :received_friendings, foreign_key: :friend_id,
                                 class_name: "Friending"

  has_many :users_friended_by, through: :received_friendings,
                               source: :friend_initiator
  

  def friends_with?(user)
    #for now only true when a user has initiated a friending
    friended_users.pluck(:id).include?(user.id)
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
end
