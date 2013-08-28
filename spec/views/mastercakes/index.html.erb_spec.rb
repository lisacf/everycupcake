require 'spec_helper'

describe "mastercakes/index" do
  before(:each) do
    assign(:mastercakes, [
      stub_model(Mastercake,
        :name => "Name",
        :description => "Description",
        :source => "Source"
      ),
      stub_model(Mastercake,
        :name => "Name",
        :description => "Description",
        :source => "Source"
      )
    ])
  end

  it "renders a list of mastercakes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Source".to_s, :count => 2
  end
end
