class User < ActiveRecord::Base
  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, {
    presence: true, 
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  }

  has_secure_password
  validates :password, length: { minimum: 8 }
  
  has_secure_token :auth_token

  ROLES = %i[guest student teacher admin]
  validates :role, presence: true

  before_save { self.email.downcase! }

  def has_role?(base_role)
    ROLES.index(base_role) <= ROLES.index(self.role.to_sym)
  end
end