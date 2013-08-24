class AddIndexToRestaurantName < ActiveRecord::Migration
  def change
    add_index :restaurants, :name, unique:true
  end
end
