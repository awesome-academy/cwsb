class CreateVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :venues do |t|
      t.string :name, null: false
      t.string :phone_number
      t.string :email
      t.string :website
      t.integer :number_of_floors
      t.integer :floor_space
      t.integer :number_of_rooms
      t.integer :number_of_desks
      t.text :description, null: false
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :venues, :deleted_at
  end
end
