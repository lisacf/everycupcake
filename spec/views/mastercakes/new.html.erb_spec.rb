require 'spec_helper'

describe "mastercakes/new" do
  before(:each) do
    assign(:mastercake, stub_model(Mastercake,
      :name => "MyString",
      :description => "MyString",
      :source => "MyString"
    ).as_new_record)
  end

  it "renders new mastercake form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mastercakes_path, "post" do
      assert_select "input#mastercake_name[name=?]", "mastercake[name]"
      assert_select "input#mastercake_description[name=?]", "mastercake[description]"
      assert_select "input#mastercake_source[name=?]", "mastercake[source]"
    end
  end
end
