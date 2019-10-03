class VenueAmenity < ApplicationRecord
  acts_as_paranoid

  belongs_to :venue
  belongs_to :amenity

  scope :find_by_amenity_and_venue, ->(venue, amenity) do
    find_by venue: venue, amenity: amenity
  end
end
