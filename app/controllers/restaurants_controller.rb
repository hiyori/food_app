class RestaurantsController < ApplicationController

  def autocomplete
    @restaurants=Restaurant.autocomplete(params[:term].downcase)
    #label: "#{r.name} #{r.link}"
    render json: @restaurants.map {|r| {label: "#{r.name}", value: r.name, link: r.link}}
  end

end
