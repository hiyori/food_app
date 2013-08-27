class CreateDishParts < ActiveRecord::Migration

  def change
    create_table :dish_parts do |t|
      t.integer :order_id, references: [:Order, :id]
      t.integer :dish_id, references: [:Dish, :id]
      t.timestamps
    end
    add_index :dish_parts, :order_id
    add_index :dish_parts, :dish_id
    add_index :dish_parts, [:dish_id, :order_id], unique:true  
  end
end
