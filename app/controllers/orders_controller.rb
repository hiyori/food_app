class OrdersController < ApplicationController
   
  def create_order
    user=User.find(session[:id])
    order=user.orders.create!
    redirect_to edit_order_path(order)
  end
  
  def create_new
    user=User.find_by(remember_token: params[:token])
    order=user.orders.create!
    session[:id]=user.id
    redirect_to edit_order_path(order)
  end
  
  def edit
    @order=Order.find(params[:id])
    if @restaurant.nil? then @restaurant=Restaurant.new end
    if @dish.nil? then @dish=Dish.new end
  end
  
  def restaurant
    @order=Order.find(params[:id])
    @restaurant=Restaurant.find_or_create_by(name: params[:restaurant][:name])
    @restaurant.update_attributes(link: params[:restaurant][:link])
    if @restaurant.save
      t=@order.restaurants.find_by(name: params[:restaurant][:name])
      if t.nil? 
        @order.restaurants << @restaurant
        add_vote_rest
      end  
      redirect_to edit_order_path(@order)
    else
       @dish=Dish.new
       render "edit"  
    end  
      edit_order_path(@order)
  end
  
  def dish
    @order=Order.find(params[:id])
    @dish=Dish.find_or_create_by(name: params[:dish][:name])
    if @dish.save
      t=@order.dishes.find_by(name: params[:dish][:name])
      if t.nil?
        @order.dishes << @dish
        add_vote_dish 
      end
      redirect_to edit_order_path(@order)
    else
      @restaurant=Restaurant.new
       render "edit"  
    end  
      edit_order_path(@order)
  end

  def add_vote_dish
    dish_part=DishPart.last
    prev_vote=find_prev_dish_vote(dish_part.order_id)
    prev_vote.destroy if !prev_vote.nil?
    dish_part.users << User.find(session[:id])
  end
  
  def add_vote_rest
    rest_part=RestaurantPart.last
    prev_vote=find_prev_rest_vote(rest_part.order_id)
    prev_vote.destroy if !prev_vote.nil?
    rest_part.users<< User.find(session[:id])  
    #rescue ActiveRecord::RecordNotSaved => e
     # r=Restaurant.last.destroy
      #return   
  end
  
#  def rest_votes(id)
#    rest_list=RestaurantPart.where(order_id:id)
#    users_list=rest_list.collect{|r| r.users}
#    users_list.collect{|u| u[0]}
#  end
  
  
  def vote
#    parts=RestaurantPart.where(order_id: params[:id])
#    parts_id=parts.collect{|p| p.id}
#    orders_votes=RestaurantsVote.where("restaurant_part_id in (?)",parts_id)
#    previous_vote=orders_votes.find_by(user_id: session[:id])
    previous_vote=find_prev_rest_vote(params[:id])
    rp=RestaurantPart.where(order_id: params[:id],restaurant_id: params[:rest])
    current_vote=RestaurantsVote.new
    current_vote.restaurant_part_id=rp[0].id
    current_vote.user_id=session[:id]
    if current_vote.save
      previous_vote.destroy if !previous_vote.nil?
    end  
    redirect_to edit_order_path(params[:id])
  end
  
  def find_prev_rest_vote(order_id)
    parts=RestaurantPart.where(order_id: order_id)
    parts_id=parts.collect{|p| p.id}
    votes=RestaurantsVote.where("restaurant_part_id in (?)",parts_id)
    previous_vote=votes.find_by(user_id: session[:id])
    previous_vote
  end
  
  def find_prev_dish_vote(order_id)
    parts=DishPart.where(order_id: order_id)
    parts_id=parts.map{|p| p.id}
    votes=DishVote.where("dish_part_id in (?)", parts_id)
    prev_vote=votes.find_by(user_id, session[:id])
    prev_vote
  end
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :link)
  end
  
end































































































