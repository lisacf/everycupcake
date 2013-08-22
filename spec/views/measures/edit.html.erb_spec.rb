require 'spec_helper'

describe "measures/edit" do
  before(:each) do
    @measure = assign(:measure, stub_model(Measure,
      :name => "MyString"
    ))
  end

  it "renders the edit measure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", measure_path(@measure), "post" do
      assert_select "input#measure_name[name=?]", "measure[name]"
    end
  end
end
