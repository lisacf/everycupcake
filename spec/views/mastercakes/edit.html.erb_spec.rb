require 'spec_helper'

describe "mastercakes/edit" do
  before(:each) do
    @mastercake = assign(:mastercake, stub_model(Mastercake,
      :name => "MyString",
      :description => "MyString",
      :source => "MyString"
    ))
  end

  it "renders the edit mastercake form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mastercake_path(@mastercake), "post" do
      assert_select "input#mastercake_name[name=?]", "mastercake[name]"
      assert_select "input#mastercake_description[name=?]", "mastercake[description]"
      assert_select "input#mastercake_source[name=?]", "mastercake[source]"
    end
  end
end
