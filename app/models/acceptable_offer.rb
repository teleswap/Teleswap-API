class AcceptableOffer < ApplicationRecord
  belongs_to :listing
  has_many :counter_offers
end
