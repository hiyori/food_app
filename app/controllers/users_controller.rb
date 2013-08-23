class UsersController < ApplicationController
  
  def new
    if signed_in? then render "sessions/new" end 
    @user=User.new
  end
  
  def create
    @user = User.find_or_create_by(user_params)
    if @user.save
      flash[:a]=@user.remember_token
      send_email(@user)
    else
      render "new"
    end
  end
        
  private

  def user_params
    params.require(:user).permit(:email)
  end
  
  def send_email(user)
    UserMailer.welcome_email(user).deliver
    flash[:success]="The email was sent"
    redirect_to root_url
  end
  
end
