class Venue < ApplicationRecord
  validates :name, :location, :description, :capacity, :photos, :price_per_hour, presence: true
  validates :description, length: { minimum: 50 }

  has_many_attached :photos

  has_many :bookings, dependent: :destroy

  belongs_to :user

<<<<<<< HEAD
  has_many :reviews
=======
  has_many :bookmarks, dependent: :destroy


  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?


  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }


>>>>>>> 5afd849c4723204c9b31939f9f836b13cb3aa416
end
