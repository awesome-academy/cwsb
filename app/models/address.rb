class Address < ApplicationRecord
  geocoded_by :details
  after_validation :geocode
  belongs_to :county, optional: true
  belongs_to :venue, optional: true, inverse_of: :address
  has_many :spaces, through: :venue

  validates :details, presence: true
end
