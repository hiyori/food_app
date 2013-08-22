class SessionsController < ApplicationController
  
  def create
    user=User.find_by(remember_token: params[:token])
    session[:id]=user.id
    cookies[:id]={value: user.id, expires: 30.days.from_now.utc}
    return redirect_to root_url
  end
  
  def destroy
    session.delete(:id)
    cookies.delete(:id)
    redirect_to root_url
  end
  
end
