class User < ActiveRecord::Base
  has_one :profile
  has_many :korvais
  has_many :followings, foreign_key: :follower_id
  has_many :followers, class_name: 'Following', foreign_key: :followee_id

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {
    presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  }

  has_secure_password
  validates :password, length: { minimum: 8 }
  
  has_secure_token :auth_token

  before_save { self.email.downcase! }
end