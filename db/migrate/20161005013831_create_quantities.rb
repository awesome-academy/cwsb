class CreateQuantities < ActiveRecord::Migration[5.0]
  def change
    create_table :quantities do |t|
      t.string :content, null: false

      t.timestamps
    end
  end
end
