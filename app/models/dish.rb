class Dish < ActiveRecord::Base
  
  has_many :dish_parts, dependent: :destroy
  has_many :orders, through: :dish_parts
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  
  
  def self.autocomplete(search)
    Dish.where("LOWER(name) LIKE ?", "%#{search}%")
  end
    
end
