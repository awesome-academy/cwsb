class CreateInvoices < ActiveRecord::Migration[5.0]
  def change
    create_table :invoices do |t|
      t.float :amount
      t.integer :state
      t.references :booking, index: true, foreign_key: true
      t.references :coupon, index: true, foreign_key: true

      t.timestamps
    end
  end
end
