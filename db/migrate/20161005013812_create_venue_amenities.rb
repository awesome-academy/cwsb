class CreateVenueAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :venue_amenities do |t|
      t.references :amenity, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.datetime "deleted_at"

      t.timestamps
    end
  end
end
