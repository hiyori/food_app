class UsersController < ApplicationController
  
  def new
    @user=User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:a]="User was created"
      flash[:b]=@user.remember_token
      send_email(@user)
    else
      render "new"
    end
  end
  
  def update
    remember_token = User.new_remember_token
    @u.update_attribute(:remember_token, User.encrypt(remember_token))
    flash[:a]="User was updated"
    send_email(@u)
  end
  
  def check_user
     @u = User.find_by(email: user_params[:email])
     if @u.nil?
      return create 
     else
       return update
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
