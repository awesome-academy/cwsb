class County < ApplicationRecord
  belongs_to :city

  has_many :addresses

  validates :name, presence: true
end
