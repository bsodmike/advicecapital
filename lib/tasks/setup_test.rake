namespace :setup do
	desc "Setup a test user with super_admin role"
	task :user => :environment do
    User.create!(:email => "test@test.dk", :password => "test12")
    User.last.update_attribute(:role, "super_admin")
	end

end