class User < ApplicationRecord
  has_secure_password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :username, presence: true, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX}

  has_many :listings
  has_many :acceptable_offers, through: :listings
  has_many :counter_offers, through: :acceptable_offers


end
