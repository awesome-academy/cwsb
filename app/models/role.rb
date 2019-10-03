class Role < ApplicationRecord
  has_many :permissions
  has_many :admins
  has_many :user_role_venues
  has_many :venues, through: :user_role_venues
  has_many :users, through: :user_role_venues

  validates :type_role, presence: true

  enum type_role: {owner: 1, manager: 2, client_service: 3, reception: 4}
end
