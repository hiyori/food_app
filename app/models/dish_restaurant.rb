class DishRestaurant < ActiveRecord::Base
  belongs_to :dish
  belongs_to :restaurant
  
  validates :dish_id, presence: true
  validates :restaurant_id, presence: true
end
