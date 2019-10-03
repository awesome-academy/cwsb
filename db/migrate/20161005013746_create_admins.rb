class CreateAdmins < ActiveRecord::Migration[5.0]
  def change
    create_table :admins do |t|
      t.string :password
      t.references :role, index: true, foreign_key: true

      t.timestamps
    end
  end
end
