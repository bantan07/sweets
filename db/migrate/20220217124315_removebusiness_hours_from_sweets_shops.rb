class RemovebusinessHoursFromSweetsShops < ActiveRecord::Migration[5.2]
  def change
    remove_column :sweets_shops, :business_hours, :integer
  end
end
