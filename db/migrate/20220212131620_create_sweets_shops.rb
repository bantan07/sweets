class CreateSweetsShops < ActiveRecord::Migration[5.2]
  def change
    create_table :sweets_shops do |t|

      t.integer :user_id
      t.string :image_id
      t.string :shop_name
      t.string :item_name
      t.string :introduction
      t.string :address
      t.string :genre
      t.string :regular_holiday
      t.string :tag
      t.integer :price
      t.integer :business_hours
      t.datetime :created_at
      t.datetime :updated_at

    end
  end
end
