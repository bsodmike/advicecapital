require 'spec_helper'

describe "recipients/new.html.erb" do
  before(:each) do
    assign(:recipient, stub_model(Recipient,
      :firstname => "MyString",
      :lastname => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new recipient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipients_path, :method => "post" do
      assert_select "input#recipient_firstname", :name => "recipient[firstname]"
      assert_select "input#recipient_lastname", :name => "recipient[lastname]"
      assert_select "input#recipient_email", :name => "recipient[email]"
    end
  end
end
