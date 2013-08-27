class AddIndexToRestaurantsVote < ActiveRecord::Migration
  def change
    add_index :restaurants_votes, [:restaurant_part_id, :user_id], unique:true  
  end
end
