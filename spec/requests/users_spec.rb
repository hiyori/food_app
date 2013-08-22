require 'spec_helper'

describe "Users" do
  
  subject {page}
  
  describe "signup" do
  
    before {visit root_path}
    
    describe "with invalid information" do
      it "should not create new account" do
        expect {click_button "Send email"}.not_to change(User, :count)
      end   
    end
    
    describe "with valid information" do
      before { fill_in "Email", with: "example_email@example.com" }
      
      it "should create an account" do
          expect {click_button "Send email"}.to change(User, :count)
      end
       
    end
    
  end
  
  describe "signin" do
  
    before {visit root_path}
    
    describe "with invalid information" do
      
      before {click_button "Send email"}
      
      it {should have_content("Login")}
      it {should have_selector("div.alert.alert-error")}
      
    end
    
    describe "with valid information" do
      before do 
        fill_in "Email", with: "example_email@example.com" 
        click_button "Send email"
      end
       
      it {should have_selector("div.alert.alert-success")} 
           
    end
  
  end

 
end
