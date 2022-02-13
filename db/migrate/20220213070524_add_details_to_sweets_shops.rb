class AddDetailsToSweetsShops < ActiveRecord::Migration[5.2]
  def change
    add_column :sweets_shops, :search, :string
  end
end
