class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.references :notifiable, polymorphic: true, index: true
      t.integer :receiver_id
      t.integer :owner_id
      t.boolean :status, default: false
      t.string :message

      t.timestamps
    end
    add_index :notifications, :receiver_id
    add_index :notifications, :owner_id
    add_index :notifications, [:receiver_id, :owner_id]
  end
end
