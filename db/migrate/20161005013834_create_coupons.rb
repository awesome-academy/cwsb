class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :code
      t.float :amount, null: false
      t.integer :coupon_type, null: false
      t.datetime :applied_date
      t.datetime :expired_date
      t.boolean :active
      t.references :space, index: true, foreign_key: true
      t.references :quantity, index: true, foreign_key: true
      t.references :booking_type, index: true, foreign_key: true
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :coupons, :deleted_at
  end
end
