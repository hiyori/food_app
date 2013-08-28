require 'spec_helper'

describe "Orders" do
  
  subject {page}
  let (:user1){ user1=FactoryGirl.create(:user)}
  
  before do
    sign_in user1    
  end
  
  describe "voting" do
    
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
  describe "autocomplete",js: true do
    it "should autocomplete dish name" do
      binding.pry
      add_dish("dish")
      s="ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all a:contains(\"dish\")"
      fill_in "dish_magic", with: "d"
      sleep(3)
      page.execute_script "$('#{s}').
  trigger(\"mouseenter\").click();"
    end
  end #autocomplete
=end  
end













































