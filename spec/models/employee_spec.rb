require 'spec_helper'

describe Employee do
  it "name should not be empty" do
    employee = build(:employee, :name => '' )
    employee.should_not be_valid
    employee.errors[:name].should_not be_nil     
  end
  
  it "position should not be empty" do
    employee = build( :employee, :position => nil)
    employee.should_not be_valid
    employee.errors[:position].should_not be_nil     
  end
end

