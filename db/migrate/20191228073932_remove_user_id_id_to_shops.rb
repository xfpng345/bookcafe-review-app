class RemoveUserIdIdToShops < ActiveRecord::Migration[5.0]
  def change
    remove_column :shops,:user_id_id, :integer
  end
end
