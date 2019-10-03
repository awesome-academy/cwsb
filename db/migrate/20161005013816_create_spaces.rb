class CreateSpaces < ActiveRecord::Migration[5.0]
  def change
    create_table :spaces do |t|
      t.string :name
      t.integer :space_type, null: false
      t.integer :area, null: false
      t.integer :capicity, null: false
      t.integer :quantity, null: false
      t.text :description, null: false
      t.references :venue, index: true, foreign_key: true
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :spaces, :deleted_at
  end
end
