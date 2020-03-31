class AddColomunDefalutShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :prefecture_code, :integer
  end
end
