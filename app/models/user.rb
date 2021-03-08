class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    User.find_by_email(email).try(:authenticate, password)
  end
end
