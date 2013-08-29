class Dish < ActiveRecord::Base
  
  has_many :dish_parts, dependent: :destroy
  has_many :orders, through: :dish_parts
  
  has_many :dish_restaurants, dependent: :destroy
  has_many :restaurants, through: :dish_restaurants
    
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
  
  def self.autocomplete(search)
    Dish.where("LOWER(name) LIKE ?", "%#{search}%")
  end
    
end
