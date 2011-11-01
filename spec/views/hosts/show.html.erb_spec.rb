require 'spec_helper'

describe "hosts/show.html.erb" do
  before(:each) do
    @host = assign(:host, stub_model(Host,
      :hostname => "Hostname",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Hostname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Location/)
  end
end
