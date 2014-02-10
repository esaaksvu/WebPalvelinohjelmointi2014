require 'spec_helper'

describe "bars/show" do
  before(:each) do
    @bar = assign(:bar, stub_model(Bar,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
