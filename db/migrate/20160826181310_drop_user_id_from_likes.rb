class DropUserIdFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :user_id
  end
end
