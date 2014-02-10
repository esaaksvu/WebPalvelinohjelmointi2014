require 'spec_helper'

describe "bars/edit" do
  before(:each) do
    @bar = assign(:bar, stub_model(Bar,
      :name => "MyString"
    ))
  end

  it "renders the edit bar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", bar_path(@bar), "post" do
      assert_select "input#bar_name[name=?]", "bar[name]"
    end
  end
end
