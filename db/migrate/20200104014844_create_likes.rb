# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
