require 'spec_helper'

describe "measures/new" do
  before(:each) do
    assign(:measure, stub_model(Measure,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new measure form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", measures_path, "post" do
      assert_select "input#measure_name[name=?]", "measure[name]"
    end
  end
end
