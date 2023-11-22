class Venue < ApplicationRecord
  validates :name, :location, :description, :capacity, :price_per_hour, presence: true
  validates :description, length: { minimum: 50 }
  has_many_attached :photos
  has_many :bookings, dependent: :destroy
  belongs_to :user
end
