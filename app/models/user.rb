class User < ActiveRecord::Base
  before_create :generate_token

  has_secure_password

  validates :password, 
            :length => { in: 6..25 },
            :allow_nil => true

  validates :email, uniqueness: true


  has_one :profile
  accepts_nested_attributes_for :profile, 
                                :reject_if => :all_blank, 
                                :allow_destroy => true

  has_many :posts

  
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
