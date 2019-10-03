class UserRoleVenue < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :role
  belongs_to :venue
end
