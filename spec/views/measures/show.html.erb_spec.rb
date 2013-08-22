require 'spec_helper'

describe "measures/show" do
  before(:each) do
    @measure = assign(:measure, stub_model(Measure,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
