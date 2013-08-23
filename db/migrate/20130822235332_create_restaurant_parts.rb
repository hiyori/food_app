class CreateRestaurantParts < ActiveRecord::Migration
  def change
    create_table :restaurant_parts do |t|
      t.integer :order_id
      t.integer :restaurant_id

      t.timestamps
    end
    add_index :restaurant_parts, :order_id
    add_index :restaurant_parts, :restaurant_id
    add_index :restaurant_parts, [:restaurant_id, :order_id], unique:true  
  end
end
