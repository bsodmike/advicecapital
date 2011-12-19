require 'spec_helper'

describe "stocks/index.html.erb" do
  before(:each) do
    assign(:stocks, [
      stub_model(Stock,
        :value => 1,
        :month => 1,
        :year => 1
      ),
      stub_model(Stock,
        :value => 1,
        :month => 1,
        :year => 1
      )
    ])
  end

  it "renders a list of stocks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
