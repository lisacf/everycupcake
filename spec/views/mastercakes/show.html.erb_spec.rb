require 'spec_helper'

describe "mastercakes/show" do
  before(:each) do
    @mastercake = assign(:mastercake, stub_model(Mastercake,
      :name => "Name",
      :description => "Description",
      :source => "Source"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Description/)
    rendered.should match(/Source/)
  end
end
