class OrdersController < ApplicationController
   
  def new
    user=User.find(session[:id])
    order=user.orders.create!
    redirect_to edit_order_path(order)
  end
    
  def edit
    @order=Order.find(params[:id])
    if @restaurant.nil? then @restaurant=Restaurant.new end
    if @dish.nil? then @dish=Dish.new end
  end
  
  # WTF? -> RestaurantsController#create
  # no voting!
  def restaurant
    @order=Order.find(params[:id])
    @restaurant=Restaurant.find_or_create_by(name: params[:restaurant][:name])
    @restaurant.update_attributes(link: params[:restaurant][:link])
    if @restaurant.save
      t=@order.restaurants.find_by(name: params[:restaurant][:name])
      if t.nil? 
        @order.restaurants << @restaurant
        add_vote_rest
      else
        flash[:error]="#{@restaurant.name} is already chosen so vote for it :)"  
      end  
      redirect_to edit_order_path(@order)
    else
       @dish=Dish.new
       render "edit"  
    end  
      edit_order_path(@order)
  end
  
  # move -> MealsController#Create
  # no voting!
  # Add VotesCotroller with actions create and destroy to manage votings
  def dish
    @order=Order.find(params[:id])
    @dish=Dish.find_or_create_by(name: params[:dish][:name])
    if @dish.save
      t=@order.dishes.find_by(name: params[:dish][:name])
      if t.nil?
        @order.dishes << @dish
        add_vote_dish
      else
        flash[:error]="#{@dish.name} is already ordered so vote for it :)"    
      end
      redirect_to edit_order_path(@order)
    else
      @restaurant=Restaurant.new
       render "edit"  
    end  
      edit_order_path(@order)
  end

  # remove
  def add_vote_dish
    dish_part=DishPart.last
    prev_vote=find_prev_dish_vote(dish_part.order_id)
    prev_vote.destroy if !prev_vote.nil?
    dish_part.users << User.find(session[:id])
  end
  
  # repove
  def add_vote_rest
    rest_part=RestaurantPart.last
    prev_vote=find_prev_rest_vote(rest_part.order_id)
    prev_vote.destroy if !prev_vote.nil?
    rest_part.users<< User.find(session[:id])   
  end
    
  
  # remove
  def vote_restaurant
    previous_vote=find_prev_rest_vote(params[:id])
    rp=RestaurantPart.where(order_id: params[:id],restaurant_id: params[:rest])
    current_vote=RestaurantsVote.new
    current_vote.restaurant_part_id=rp[0].id
    current_vote.user_id=session[:id]
    if current_vote.user_id==previous_vote.user_id && current_vote.restaurant_part_id==previous_vote.restaurant_part_id
      return redirect_to edit_order_path(params[:id])   
    end 
    if current_vote.save
      previous_vote.destroy if !previous_vote.nil?
    end  
    redirect_to edit_order_path(params[:id])
  end
# ...
  def vote_dish
    prev_vote=find_prev_dish_vote(params[:id])
    part=DishPart.where(order_id: params[:id], dish_id: params[:dish])
    current_vote=DishVote.new
    current_vote.user_id=session[:id]
    current_vote.dish_part_id = part[0].id
    if current_vote.user_id==prev_vote.user_id && current_vote.dish_part_id==prev_vote.dish_part_id
      return redirect_to edit_order_path(params[:id])  
    end   
    if current_vote.save
      prev_vote.destroy if !prev_vote.nil?
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
    prev_vote=votes.find_by(user_id: session[:id])
    prev_vote
  end
  
  def remove_rvote
    prev_vote=find_prev_rest_vote(params[:id])
    prev_vote.destroy if !prev_vote.nil?
    redirect_to edit_order_path(params[:id])
  end
  
  def remove_dvote
    prev_vote=find_prev_dish_vote(params[:id])
    prev_vote.destroy if !prev_vote.nil?
    redirect_to edit_order_path(params[:id])
  end
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :link)
  end
  
end









# ???





















































































