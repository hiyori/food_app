class RestaurantsController < ApplicationController

  def autocomplete
    @restaurants=Restaurant.autocomplete(params[:term])
    render json: @restaurants.map {|r| r.name}
  end
  
end
