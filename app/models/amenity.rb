class Amenity < ApplicationRecord
  validates :name, presence: true

  attr_accessor :venue

  after_create :create_venue_amenity_for_venue

  has_many :venue_amenities, dependent: :destroy
  has_many :images, as: :imageable
  has_many :venues, through: :venue_amenities
  has_many :price_types, through: :service_charges
  has_one :service_charge, dependent: :destroy

  accepts_nested_attributes_for :venue_amenities
  accepts_nested_attributes_for :service_charge

  scope :default, -> {where is_default: true}

  def create_venue_amenity_for_venue
    VenueAmenity.create venue_id: self.venue.id,
      amenity_id: self.id unless self.is_default?
  end
end
