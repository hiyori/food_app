class RestaurantsVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant_part
  
  validates :user_id, presence: true
  validates :restaurant_part_id, presence: true
  
  #before_save :verify_user
  
  def verify_user
    p=RestaurantPart.find(restaurant_part_id)
    parts=RestaurantPart.where(order_id: p.order_id)
    parts.each do |t|
     #v=RetaurantsVote.find_by(restaurant_part_id: t.id)
      t.users.each {|u| return false if u.id == user_id }
    end
  end
    
end
