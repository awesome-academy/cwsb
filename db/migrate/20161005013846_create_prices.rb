class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.float :price, null: false
      t.references :space, index: true, foreign_key: true
      t.references :booking_type, index: true, foreign_key: true
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :prices, :deleted_at
  end
end
