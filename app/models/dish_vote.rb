class DishVote < ActiveRecord::Base

  belongs_to :user
  belongs_to :dish_part
  
  validates :user_id, presence: true
  validates :dish_part_id, presence: true
end
