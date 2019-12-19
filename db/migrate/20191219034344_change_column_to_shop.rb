class ChangeColumnToShop < ActiveRecord::Migration[5.0]
  def change
    change_column_null :shops, :name,false
    change_column_null :shops, :image,false
    change_column_null :shops, :address,false
  end
end
