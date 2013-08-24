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
  
  describe "signed_in user" do
    before do
      user=User.find_or_create_by(email:"example@user.com")
      #sign_in user
      visit login_path(user.remember_token)
    end
    
    it {should have_content("Order")}
    
    context "add new restaurant" do
      before do
        fill_in "Name", with: "test restaurant"
        fill_in "Link", with: "www.google.pl"
      end    
      it "should increase restaurant's number" do
        expect {click_button "Submit"}.to change(Restaurant, :count)
      end
      
#      it "add button" do
#        page.find("#visible").visible?
#        click_button "Add"
#        should have_content("New restaurant")
#      end
        
    end
        
    context "home page when user is logged in"do
      before {visit root_path}
      
      it {should have_content("Order")}    
    end
    
  end

end
