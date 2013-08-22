require 'spec_helper'

describe "measures/index" do
  before(:each) do
    assign(:measures, [
      stub_model(Measure,
        :name => "Name"
      ),
      stub_model(Measure,
        :name => "Name"
      )
    ])
  end

  it "renders a list of measures" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
