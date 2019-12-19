class RenameLangitudeColumnToShops < ActiveRecord::Migration[5.0]
  def change
    rename_column :shops, :langitude, :longitude
  end
end
