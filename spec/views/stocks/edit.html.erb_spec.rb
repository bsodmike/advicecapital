require 'spec_helper'

describe "stocks/edit.html.erb" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :value => 1,
      :month => 1,
      :year => 1
    ))
  end

  it "renders the edit stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stocks_path(@stock), :method => "post" do
      assert_select "input#stock_value", :name => "stock[value]"
      assert_select "input#stock_month", :name => "stock[month]"
      assert_select "input#stock_year", :name => "stock[year]"
    end
  end
end
