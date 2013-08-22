class SessionsController < ApplicationController
  
  def new
    user=User.find_by(remember_token: params[:token])
    session[:id]=user.id
  end
  
  def destroy
    session.delete(:id)
    redirect_to root_url
  end
  
end
