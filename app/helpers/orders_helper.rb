module OrdersHelper

  def users_restaurants(order)
    restaurants=order.restaurants
    parts=RestaurantPart.where(order_id: order.id)
    votes={}
    parts.each do |p|
    name=restaurants.find(p.restaurant_id)
    votes[name]=p.users
    end
    votes
  end
  
  def users_dishes(order)
    dishes=order.dishes
    parts=DishPart.where(order_id: order.id)
    votes={}
    parts.each do |p|
    name=dishes.find(p.dish_id)
    votes[name]=p.users
    end
    votes
  end
  
  def create_link(r)
    link_to r.name, r.link, target: "_blank" 
  end  
  
end
