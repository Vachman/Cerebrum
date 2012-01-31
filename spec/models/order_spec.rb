require 'spec_helper'

describe Order do
  it "sould have name" do
    order = build(:order, :name => nil )
    order.should_not be_valid
    order.errors[:name].should_not be_nil  
  end
end
