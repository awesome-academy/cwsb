class CreateUserRoleVenues < ActiveRecord::Migration[5.0]
  def change
    create_table :user_role_venues do |t|
      t.references :user, index: true, foreign_key: true
      t.references :venue, index: true, foreign_key: true
      t.references :role, index: true, foreign_key: true
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :user_role_venues, :deleted_at
  end
end
