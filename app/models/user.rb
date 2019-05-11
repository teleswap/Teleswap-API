class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :username, presence: true, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX}

end
