class Country < ApplicationRecord
  has_many :cities

  validates :name, presence: true
  validates :country_code, presence: true
end
