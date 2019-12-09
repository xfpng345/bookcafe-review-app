class AddAddressToShops < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :address, :string
    add_column :shops, :latitude, :float
    add_column :shops, :langitude, :float
  end
end
