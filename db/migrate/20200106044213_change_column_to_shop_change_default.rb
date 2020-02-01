# frozen_string_literal: true

class ChangeColumnToShopChangeDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :shops, :likes_count, to: 0
  end
end
