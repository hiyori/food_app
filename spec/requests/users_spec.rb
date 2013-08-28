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
      #user=User.find_or_create_by(email:"example@user.com")
      user=FactoryGirl.create(:user)
      sign_in user
      #visit login_path(user.remember_token)
    end
    
    it {should have_content("Order")}
    
    context "new restaurant" do
      before do
        fill_in "restaurant_magic", with: "test restaurant"
        fill_in "link_magic", with: "www.google.pl"
      end    
      it "should increase the number of restaurants" do
        expect {click_button "rest_button"}.to change(Restaurant, :count)  
      end
      
      it "should contain users's vote for added restaurant" do
        add_restaurant("example", "example.pl")
        page.should have_content("example E")
      end
      
      it "should remove users's vote for restaurant after remove my vote button is clicked" do
        add_restaurant("example", "example.pl")
        click_link "removeRVote"
        page.should_not have_content("example E")
      end
      
      it " should have add button" do
        add_restaurant("example", "example.pl")
        page.should have_selector("input[type=button][value='Add restaurant']")
      end 
        
    end  
    
    context "new dish" do
      before do
        fill_in "dish_magic", with: "test dish"
      end    
      it "should increase the number of dishes" do
        expect {click_button "dish_button" }.to change(Dish, :count)
      end
      
      it "should contain users's vote for added dish" do
        add_dish("dish")
        page.should have_content("dish E")
      end
      
      it "should remove users's vote for dish after remove my vote button is clicked" do
        add_dish("dish")
        click_link "removeDVote"
        page.should_not have_content("dish E")
      end
      
      it " should have add button" do
        add_dish("dish")
        page.should have_selector("input[type=button][value='Add dish']")
      end
    end
    
    context "user should be able to change their mind " do
      it "when they add restaurant and then next one then users's vote should be near second restaurant" do
        add_restaurant("example", "example.pl")
        add_restaurant("other", "other.pl")
        page.should have_content("other E") 
      end
      
      it "when they add dish and then next one their vote should be near second restaurant" do
        add_dish("example")
        add_dish("other")
        page.should have_content("other E") 
      end
    end
     
            
  end #signed_in
end #main



























