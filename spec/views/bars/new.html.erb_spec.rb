require 'spec_helper'

describe "bars/new" do
  before(:each) do
    assign(:bar, stub_model(Bar,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new bar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bars_path, "post" do
      assert_select "input#bar_name[name=?]", "bar[name]"
    end
  end
end
