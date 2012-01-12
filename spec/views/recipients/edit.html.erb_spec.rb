require 'spec_helper'

describe "recipients/edit.html.erb" do
  before(:each) do
    @recipient = assign(:recipient, stub_model(Recipient,
      :firstname => "MyString",
      :lastname => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path(@recipient), :method => "post" do
      assert_select "input#recipient_firstname", :name => "recipient[firstname]"
      assert_select "input#recipient_lastname", :name => "recipient[lastname]"
      assert_select "input#recipient_email", :name => "recipient[email]"
    end
  end
end
