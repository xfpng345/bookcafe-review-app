class CangeColomunShop < ActiveRecord::Migration[5.0]
  def change
    change_column :shops, :wifi, :integer
    change_column :shops, :power, :integer
  end
end
