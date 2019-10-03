class CreatePermissions < ActiveRecord::Migration[5.0]
  def change
    create_table :permissions do |t|
      t.integer :object_type, null: false
      t.boolean :create_action, default: false
      t.boolean :read_action, default: false
      t.boolean :update_action, default: false
      t.boolean :delete_action, default: false
      t.references :role, index: true, foreign_key: true

      t.timestamps
    end
  end
end
