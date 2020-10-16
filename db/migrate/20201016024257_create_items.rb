class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :item_name
      t.text :introduction
      t.integer :tax_excluded_price
      t.string :item_image_id
      t.string :sales_status, default: 0
      t.timestamps
    end
  end
end
