require 'spec_helper'

describe SessionsController do

  describe "create session" do
  
    it "should store user's id in session" do
      @u=User.new({email:"example@user.com"})
      @u.save
      get :new, token: @u.remember_token
      session[:id].should_not be_nil
    end
  
  end  
  
end
