require "spec_helper"
require "cancan/matchers"
# ...
describe "Ability" do

	describe "as guest" do
		before(:each) do
			@ability = Ability.new(nil)
		end
	end

	describe "as investor" do
		before(:each) do
			@user = FactoryGirl(:user, :role => "investor")
			@ability = Ability.new(@user)
		end
	end

	describe "as admin" do
		before(:each) do
			@user = FactoryGirl(:user, :role => "admin")
			@ability = Ability.new(@user)
		end
	end

	describe "as superadmin" do
		it "can access all" do
			user = FactoryGirl(:user, :role => "super_admin")
			ability = Ability.new(user)
			ability.should be_able_to(:access, :all)
		end
	end

	#subject { ability }
	#let(:ability){ Ability.new(user) }

end