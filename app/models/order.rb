class Order < ActiveRecord::Base
  belongs_to :user
  
  has_many :restaurant_parts, dependent: :destroy
  has_many :restaurants, through: :restaurant_parts
  
  has_many :dish_parts, dependent: :destroy
  has_many :dishes, through: :dish_parts
  
end
