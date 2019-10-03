class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.string :picture, null: false
      t.string :title
      t.references :imageable, polymorphic: true, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
