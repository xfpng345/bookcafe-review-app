class ChangeColomunDefalutShopToArea2 < ActiveRecord::Migration[5.0]
  def change
    change_column_default :shops, :area, from: true, to: ""
  end
end
