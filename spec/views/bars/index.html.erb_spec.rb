require 'spec_helper'

describe "bars/index" do
  before(:each) do
    assign(:bars, [
      stub_model(Bar,
        :name => "Name"
      ),
      stub_model(Bar,
        :name => "Name"
      )
    ])
  end

  it "renders a list of bars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
