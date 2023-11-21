class Venue < ApplicationRecord
  validates :name, :location, :description, :capacity, :price_per_hour, presence: true
  validates :description, length: { minimum: 50 }
  has_many_attached :photos
end
