class Image < ApplicationRecord
  belongs_to :imageable, polymorphic: true, optional: true
  belongs_to :user, optional: true
  mount_uploader :picture, PictureUploader
end
