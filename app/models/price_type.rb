class PriceType < ApplicationRecord
  has_many :service_charges
  has_many :amenities, through: :service_charges
end
