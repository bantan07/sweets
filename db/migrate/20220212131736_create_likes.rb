class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|

      t.integer :user_id
      t.integer :sweets_shop_id
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
