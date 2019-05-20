class Image < ApplicationRecord
  belongs_to :listing, optional: true
end
