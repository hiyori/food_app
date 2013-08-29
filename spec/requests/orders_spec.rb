require 'spec_helper'

describe "Orders" do
  
  subject {page}
  let (:user1){ user1=FactoryGirl.create(:user)}

  
  describe "voting" do
    
    before do
      sign_in user1    
    end
    
    it "should add current user vote to the restaurant added by other user" do
      add_restaurant("example", "example.pl")
      add_dish("dish")
      o=user1.orders.first
      user2 = FactoryGirl.create(:user, email: "other@user.com")
      sign_in user2
      visit edit_order_path(o)
      click_link "addRVote"
      page.should have_content("example E O")
    end
  
    it "should add current user vote to the restaurant added by other user" do
      add_restaurant("example", "example.pl")
      add_dish("dish")
      o=user1.orders.first
      user2 = FactoryGirl.create(:user, email: "other@user.com")
      sign_in user2
      visit edit_order_path(o)
      click_link "addDVote"
      page.should have_content("dish E O")
    end
  end
  

=begin  
describe "autocomplete" do
        
    it "should autocomplete dish name", js: true do
      user=User.create(email: "sample@user.com")
      @driver = Selenium::WebDriver.for(:firefox)
      @driver.navigate.to "http://localhost:3000/"
      @driver.find_element(name: "user_email").val(user.email)
      sign_in user, no_capybara: true
      page.has_content?('New dish') 
      fill_in "dish_magic", with: "dish"
      click_button "dish_button"
      s="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all a:contains(\"dish\")"
      fill_in "dish_magic", with: "d"
      sleep(3)
      page.execute_script "$('#{s}').
  trigger(\"mouseenter\").click();"
    end
  end #autocomplete
=end 
end













































