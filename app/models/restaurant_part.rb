class RestaurantPart < ActiveRecord::Base
  belongs_to :order
  belongs_to :restaurant
  
  has_many :restaurants_votes
  has_many :users, through: :restaurants_votes
  
  validates :order_id, presence: true
  validates :restaurant_id, presence: true
end
