class RestaurantsController < ApplicationController

  def autocomplete
    @restaurants=Restaurant.autocomplete(params[:term].downcase)
    render json: @restaurants.map {|r| {label: "#{r.name} #{r.link}", value: r.name, link: r.link}}
  end

end
