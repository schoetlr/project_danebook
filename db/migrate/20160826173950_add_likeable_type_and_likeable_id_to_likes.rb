class AddLikeableTypeAndLikeableIdToLikes < ActiveRecord::Migration
  def change
    add_column :likes, :likeable_type, :string
    add_column :likes, :likeable_id, :integer

    add_index :likes, [:likeable_type, :likeable_id]
  end


end
