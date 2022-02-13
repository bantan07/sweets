class AddDetailsToSweetsShops2 < ActiveRecord::Migration[5.2]
  def change
    add_column :sweets_shops, :status, :integer
  end
end
