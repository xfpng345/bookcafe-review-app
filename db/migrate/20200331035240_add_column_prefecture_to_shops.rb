class AddColumnPrefectureToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :prefecture_code, :integer, null: false
  end
end
