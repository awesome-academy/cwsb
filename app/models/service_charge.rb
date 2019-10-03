class ServiceCharge < ApplicationRecord
  belongs_to :amenity, optional: true
  belongs_to :price_type, optional: true
end
