class CreatePriceTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :price_types do |t|
      t.string :content

      t.timestamps
    end
  end
end
