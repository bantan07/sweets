class CreateTagRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_relationships do |t|
      t.integer :tag_id
      t.integer :sweets_shop_id
    end
  end
end
