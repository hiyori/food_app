class RestaurantsVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant_part
  
  validates :user_id, presence: true
  validates :restaurant_part_id, presence: true
end
