class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    def up
      change_column :shops, :prefecture_code, :intger, null: false, default: false
    end

    def down
      change_column :shops, :prefecture_code, :intger, null: true
    end
  end
end
