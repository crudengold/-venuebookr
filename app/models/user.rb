class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings

  has_many :bookmarks

  has_many :venues, through: :bookings

  has_many :venues, through: :bookmarks

  has_many :venues, dependent: :destroy

  has_many :reviews
end
