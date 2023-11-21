class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: { message: 'must enter dates' }
  belongs_to :venue
  belongs_to :user
end
