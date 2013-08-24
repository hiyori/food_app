require 'spec_helper'

describe OrdersController do

  describe "create session" do
  
    it "should store user's id in session" do
      @u=User.find_or_create_by({email:"example@user.com"})
      get :create_new, token: @u.remember_token
      session[:id].should_not be_nil
    end
  
  end  
  
end
