class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :password, :password_confirmation, presence: true, length: { minimum: 8 }
  validates :first_name, :last_name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
