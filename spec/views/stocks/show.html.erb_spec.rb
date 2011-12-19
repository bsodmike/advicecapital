require 'spec_helper'

describe "stocks/show.html.erb" do
  before(:each) do
    @stock = assign(:stock, stub_model(Stock,
      :value => 1,
      :month => 1,
      :year => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
