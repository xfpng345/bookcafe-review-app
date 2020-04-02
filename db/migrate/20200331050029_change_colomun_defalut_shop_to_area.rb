class ChangeColomunDefalutShopToArea < ActiveRecord::Migration[5.0]
  def change
    change_column_default :shops, :area, from: false, to: true
  end
end
