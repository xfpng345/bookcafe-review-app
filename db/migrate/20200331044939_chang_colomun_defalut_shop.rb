class ChangColomunDefalutShop < ActiveRecord::Migration[5.0]
  def change
    def up
      remove_column :shops, :prefecture_code, :integer
    end
  end
end
