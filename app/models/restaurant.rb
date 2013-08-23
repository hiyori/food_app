class Restaurant < ActiveRecord::Base
  has_many :restaurant_parts
  has_many :orders, through: :restaurant_parts
end
