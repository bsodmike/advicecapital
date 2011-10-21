require 'spec_helper'

describe "PasswordResets" do
 it "emails user when requesting password reset" do
   user = Factory(:user)
   visit signin
   click_link "Glemt kodeord"
   fill_in "email", :with => user.email
   click_button "Nulstil kodeord"
 end
end
