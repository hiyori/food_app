require "spec_helper"

describe UserMailer do
      
    describe "email" do
      
      before do
        @user = User.new(email: "user@example.com")
        @user.save
        @mail = UserMailer.welcome_email(@user).deliver
      end
      
      it "should not be empty" do
        @mail.should_not be_nil
      end
      
      it "should be sent" do   
        ActionMailer::Base.deliveries.empty?.should == false
      end
      
      
      it "should be send to user@example.com" do
        expect(@mail.to[0]).to eq(@user.email)
      end
     
    end
    
end
