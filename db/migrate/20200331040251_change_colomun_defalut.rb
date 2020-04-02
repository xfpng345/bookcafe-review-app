class ChangeColomunDefalut < ActiveRecord::Migration[5.0]
  def change
    change_column :shops, :area, :string, default: false
    change_column :shops, :prefecture_code, :integer, default: false
  end
end
