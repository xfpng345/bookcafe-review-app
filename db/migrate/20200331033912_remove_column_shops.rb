class RemoveColumnShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops, :power, :string
    remove_column :shops, :wifi, :integer
  end
end
