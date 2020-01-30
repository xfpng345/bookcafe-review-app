# frozen_string_literal: true

class AddColumnToShop < ActiveRecord::Migration[5.0]
  def change
    add_column :shops, :area, :string, null: false
  end
end
