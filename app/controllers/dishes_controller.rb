class DishesController < ApplicationController
  
  def autocomplete
    @dishes=Dish.autocomplete(params[:term].downcase)
    render json: @dishes.map {|r| r.name }
  end
end
