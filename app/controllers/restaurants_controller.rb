class RestaurantsController < ApplicationController
  # Here should be index 
  def autocomplete
    @restaurants=Restaurant.autocomplete(params[:term].downcase)
    render json: @restaurants.map {|r| {label: "#{r.name} #{r.link}", value: r.name, link: r.link}}
  end

  # create, edit, update actions should be here too
end
