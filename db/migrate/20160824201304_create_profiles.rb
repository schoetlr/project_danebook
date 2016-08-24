class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :phone
      t.date :birthday
      t.string :college
      t.string :hometown
      t.string :current_location
      t.text :about
      t.text :words_to_live_by
      t.integer :user_id

      t.timestamps null: false
    end

    add_index :profiles, :user_id
  end
end
