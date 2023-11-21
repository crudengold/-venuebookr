class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  belongs_to :venue
  belongs_to :user
end
