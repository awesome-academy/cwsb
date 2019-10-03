class CreateServiceCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :service_charges do |t|
      t.belongs_to :amenity, index: true
      t.references :price_type, foreign_key: true
      t.float :price
      t.integer :quantity

      t.timestamps
    end
  end
end
