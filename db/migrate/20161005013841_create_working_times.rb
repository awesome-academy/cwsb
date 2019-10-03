class CreateWorkingTimes < ActiveRecord::Migration[5.0]
  def change
    create_table :working_times do |t|
      t.integer :day_in_week, null: false
      t.time :working_from, null: false
      t.time :working_to, null: false
      t.references :venue, index: true, foreign_key: true
      t.integer :status, null: false
      t.datetime "deleted_at"

      t.timestamps
    end
    add_index :working_times, :deleted_at
  end
end
