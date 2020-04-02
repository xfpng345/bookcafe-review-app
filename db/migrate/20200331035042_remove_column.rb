class RemoveColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :prefecture_code, :integer
  end
end
