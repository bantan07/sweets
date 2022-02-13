class RenameIntroductionColumnToSwwtsShops < ActiveRecord::Migration[5.2]
  def change
    rename_column :sweets_shops, :introduction, :body
  end
end
