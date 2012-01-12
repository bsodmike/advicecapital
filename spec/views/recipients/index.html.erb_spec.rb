require 'spec_helper'

describe "recipients/index.html.erb" do
  before(:each) do
    assign(:recipients, [
      stub_model(Recipient,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email"
      ),
      stub_model(Recipient,
        :firstname => "Firstname",
        :lastname => "Lastname",
        :email => "Email"
      )
    ])
  end

  it "renders a list of recipients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
