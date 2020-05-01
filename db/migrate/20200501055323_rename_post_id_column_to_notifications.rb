class RenamePostIdColumnToNotifications < ActiveRecord::Migration[5.0]
  def change
    rename_column :notifications, :post_id, :shop_id
  end
end
