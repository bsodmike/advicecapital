describe "PasswordResets" do
 it "emails user when requesting password reset" do
   user = Factory(:user)
   visit '/signin'
   click_link "Glemt kodeord"
   fill_in "email", :with => user.email
   click_button "Nulstil kodeord"
   current_path.should eq(root_path)
   page.should have_content ("Du modtager en email med gendannelse af kodeord")
   last_email.to.should include(user.email)
 end
end
