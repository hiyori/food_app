require 'spec_helper'

describe Restaurant do
  
  describe "link" do
    
    it "should add http:// when a link does not have protocol" do
      r=Restaurant.create(name:"example", link:"www.example.com")
      r.link.should eq("http://www.example.com")
    end
    
  end
end
