describe "Users" do
	#login_admin

	it "should have a current_user" do
		subject.current_user.should_not be_nil
	end

end
