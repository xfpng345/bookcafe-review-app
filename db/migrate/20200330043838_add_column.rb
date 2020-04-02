class AddColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :prefecture, :integer
  end
end
