class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :restaurants_votes
  has_many :restaurant_parts, through: :restaurants_votes
  
  before_save :create_remember_token
  before_create :create_initials, :email_to_downcase 
   
   VALID_EMAIL_REGEX = /\A[\w+\-]+\.?[\w+]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,3}\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
  
  def email_to_downcase
    self.email=email.downcase
  end
  
  
  def create_initials
    arr=email.split(".")
    str= arr.length==2 ? arr[0][0] : arr[0][0]+arr[1][0]
    self.initials=str.upcase
  end
  
end
