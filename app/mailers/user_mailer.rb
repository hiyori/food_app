class UserMailer < ActionMailer::Base
  
  default from: "notifications@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/rt/"+@user.remember_token
    mail(to: @user.email, subject:"Welcome to Food Site")  
  end

end
