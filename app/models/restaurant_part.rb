class RestaurantPart < ActiveRecord::Base
  belongs_to :order
  belongs_to :restaurant
  
  validates :order_id, presence: true
  validates :restaurant_id, presence: true
end
