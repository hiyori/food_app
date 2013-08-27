class CreateRestaurantParts < ActiveRecord::Migration
  def change
    create_table :restaurant_parts, id: false do |t|
      t.integer :order_id, references: [:Order, :id]
      t.integer :restaurant_id, references: [:Restaurant, :id]

      t.timestamps
    end
    add_index :restaurant_parts, :order_id
    add_index :restaurant_parts, :restaurant_id
    add_index :restaurant_parts, [:restaurant_id, :order_id], unique:true  
  end
end
