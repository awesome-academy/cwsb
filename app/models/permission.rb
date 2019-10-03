class Permission < ApplicationRecord
  belongs_to :role

  validates :object_type, presence: true
end
