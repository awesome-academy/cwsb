class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_from, null: false
      t.integer :duration, null: false
      t.integer :quantity, null: false
      t.integer :state, null: false, default: 0
      t.references :user, index: true, foreign_key: true
      t.references :space, index: true, foreign_key: true
      t.references :booking_type, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.datetime "deleted_at"
      t.timestamps
    end
    add_index :bookings, :deleted_at
  end
end
