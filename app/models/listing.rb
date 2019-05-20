class Listing < ApplicationRecord
  has_many :acceptable_offers
  has_many :counter_offers, through: :acceptable_offers
  has_many :sent_offers, class_name: :CounterOffer
  has_many :images
  belongs_to :user
end
