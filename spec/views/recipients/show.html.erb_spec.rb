require 'spec_helper'

describe "recipients/show.html.erb" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :firstname => "Firstname",
      :lastname => "Lastname",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Firstname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Lastname/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
