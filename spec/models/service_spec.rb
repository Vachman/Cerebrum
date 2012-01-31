require 'spec_helper'

describe Service do
  it "should have name" do
    service = build(:service, :name => nil)
    service.should_not be_valid
    service.errors[:name].should_not be_nil 
  end
  
  it "should have price" do
    service = build(:service, :price => nil )
    service.should_not be_valid
    service.errors[:price].should_not be_nil     
  end
end
