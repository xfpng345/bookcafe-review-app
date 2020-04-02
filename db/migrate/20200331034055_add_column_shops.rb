class AddColumnShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :wifi, :boolean, default: false, null: false
    add_column :shops, :power, :boolean, default: false, null: false
  end
end
