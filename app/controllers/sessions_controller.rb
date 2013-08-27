class SessionsController < ApplicationController

  def log_in
    user=User.find_by(remember_token: params[:token])
    session[:id]=user.id
    redirect_to new_order_path
  end
  
  def destroy
    session.delete(:id)
    redirect_to root_url
  end
end
