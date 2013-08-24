module UsersHelper
    
  def signed_in?
    !session[:id].nil? || !cookies[:id].nil?
  end    
end
