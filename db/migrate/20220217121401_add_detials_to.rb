class AddDetialsTo < ActiveRecord::Migration[5.2]
  def change

    rename_column :sweets_shops, :end_time, :finish_time
  end
end
