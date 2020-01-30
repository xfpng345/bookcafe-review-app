# frozen_string_literal: true

class ChangeColumnToAllowNull < ActiveRecord::Migration[5.0]
  def up
    change_column :shops, :image, :string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :shops, :image, :string, null: false
  end
end
