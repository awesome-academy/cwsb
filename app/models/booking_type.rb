class BookingType < ApplicationRecord
  has_many :bookings
  has_many :prices
  has_many :coupons

  belongs_to :space
  validates :name, presence: true
end
