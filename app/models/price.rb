class Price < ApplicationRecord
  acts_as_paranoid

  belongs_to :space
  belongs_to :booking_type

  validates :price, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0
end
