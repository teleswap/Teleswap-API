class CounterOffer < ApplicationRecord
  belongs_to :user
  belongs_to :acceptable_offer
  has_many :images
end
