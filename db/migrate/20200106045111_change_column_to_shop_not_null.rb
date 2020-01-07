class ChangeColumnToShopNotNull < ActiveRecord::Migration[5.0]
  def up
    change_column_null :shops, :likes_count, false, 0
    change_column :shops, :likes_count, :integer, default: 0
  end

  def down
    change_column_null :shops, :likes_count, true, nil
    change_column :shops, :likes_count, :integer, default: nil
  end
end
