class DropPostIdFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :post_id
  end
end
