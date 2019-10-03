class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.decimal :price
      t.text :notification_params
      t.string :status
      t.string :transaction_id
      t.datetime :purchased_at
      t.belongs_to :order, index: true

      t.timestamps
    end
  end
end
