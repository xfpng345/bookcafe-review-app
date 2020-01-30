# frozen_string_literal: true

class AddNumcountToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :likes_count, :integer
  end
end
