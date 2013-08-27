class Restaurant < ActiveRecord::Base
  has_many :restaurant_parts, dependent: :destroy
  has_many :orders, through: :restaurant_parts
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
  validates :link, presence: true
  
  before_save :create_link
  
  def self.autocomplete(search)
    Restaurant.where("LOWER(name) LIKE ?", "%#{search}%")
  end
  
  private
  
  def create_link
    if link.start_with?("www") || !link.start_with?("http://www", "http://")
      self.link="http://"+link
    end  
  end 
  
end
