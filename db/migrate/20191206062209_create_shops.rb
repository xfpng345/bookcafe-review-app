class CreateShops < ActiveRecord::Migration[5.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :image
      t.text :text
      t.timestamps
    end
  end
end
