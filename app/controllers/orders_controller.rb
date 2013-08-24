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
  end
  
  def restaurant
    @order=Order.find(params[:id])
    @restaurant=Restaurant.create(restaurant_params)
    if @restaurant.save
      @order.restaurants << @restaurant 
      redirect_to edit_order_path(@order)
    else
       render "edit"  
    end  
      edit_order_path(@order)
  end
  
  def restaurant_params
    params.require(:restaurant).permit(:name, :link)
  end
  
end
