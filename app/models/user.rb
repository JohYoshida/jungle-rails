class User < ActiveRecord::Base
  has_many :reviews
  has_secure_password

  validates :first_name, :last_name, :password_digest, :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
end
