class DishPart < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :dish
  
  has_many :dish_votes
  has_many :users, through: :dish_votes
  
  validates :order_id, presence: true
  validates :dish_id, presence: true
  
end
