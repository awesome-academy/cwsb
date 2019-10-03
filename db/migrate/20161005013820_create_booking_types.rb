class CreateBookingTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :booking_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
