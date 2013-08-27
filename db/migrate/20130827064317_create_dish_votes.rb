class CreateDishVotes < ActiveRecord::Migration
  def change
    create_table :dish_votes do |t|
      t.integer :dish_part_id
      t.integer :user_id
      
      t.timestamps
    end
    add_index :dish_votes, :dish_part_id
    add_index :dish_votes, :user_id
  end
end

