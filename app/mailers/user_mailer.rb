class UserMailer < ActionMailer::Base
  
  default from: "notifications@example.com"
  
  def welcome_email(user)
    @user = user
    @url = "http://shrouded-peak-9013.herokuapp.com/rt/"+@user.remember_token
    mail(to: @user.email, subject:"Welcome to Food Site")  
  end

end
