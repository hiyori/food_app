class DishesController < ApplicationController
  # index
  def autocomplete
    @dishes=Dish.autocomplete(params[:term].downcase)
    render json: @dishes.map {|r| r.name }
  end
  
  # create, edit, update should be here
end
