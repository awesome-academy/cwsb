class Quantity < ApplicationRecord
  has_many :coupons

  validates :content, presence: true
end
