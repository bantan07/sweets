class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :sweets_shops, :prefectures, :string
  end
end
