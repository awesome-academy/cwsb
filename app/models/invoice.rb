class Invoice < ApplicationRecord
  belongs_to :coupon
  belongs_to :booking
end
