class CreateAmenities < ActiveRecord::Migration[5.0]
  def change
    create_table :amenities do |t|
      t.string :name, null: false
      t.string :description
      t.boolean :is_free, default: false
      t.boolean :is_default, default: false

      t.timestamps
    end
  end
end
