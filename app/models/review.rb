class Review < ApplicationRecord
  belongs_to :venue
  belongs_to :user

  validates :rating, :comment, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, inclusion: { in: 0..5 }
end
