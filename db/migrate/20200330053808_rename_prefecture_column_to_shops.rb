class RenamePrefectureColumnToShops < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :prefecture, :prefecture_code
  end
end
