require 'spec_helper'

describe "stocks/new.html.erb" do
  before(:each) do
    assign(:stock, stub_model(Stock,
      :value => 1,
      :month => 1,
      :year => 1
    ).as_new_record)
  end

  it "renders new stock form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stocks_path, :method => "post" do
      assert_select "input#stock_value", :name => "stock[value]"
      assert_select "input#stock_month", :name => "stock[month]"
      assert_select "input#stock_year", :name => "stock[year]"
    end
  end
end
