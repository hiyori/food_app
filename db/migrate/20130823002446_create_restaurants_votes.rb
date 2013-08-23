class CreateRestaurantsVotes < ActiveRecord::Migration
  def change
    create_table :restaurants_votes do |t|
      t.integer :restaurant_part_id
      t.integer :user_id

      t.timestamps
    end
     add_index :restaurants_votes, :restaurant_part_id
     add_index :restaurants_votes, :user_id
  end
end
