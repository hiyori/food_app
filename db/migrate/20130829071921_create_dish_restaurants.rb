class CreateDishRestaurants < ActiveRecord::Migration
  def change
    create_table :dish_restaurants do |t|
      t.integer :dish_id, references: [:Dish, :id]
      t.integer :restaurant_id, references: [:Restaurant, :id]

      t.timestamps
    end
    add_index :dish_restaurants, :dish_id
    add_index :dish_restaurants, :restaurant_id
    add_index :dish_restaurants, [:restaurant_id, :dish_id], unique:true 
  end
end

