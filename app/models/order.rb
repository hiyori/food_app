class Order < ActiveRecord::Base
  belongs_to :user
  has_many :restaurant_parts, dependent: :destroy
  has_many :restaurants, through: :restaurant_parts
  
  validates :user_id, presence: true
end
