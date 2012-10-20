require 'factory_girl'

FactoryGirl.define do
	factory :user do |f|
  	f.sequence(:name) { |n| "test#{n}"}
  	f.sequence(:email) { |n| "test#{n}@example.com" }
  	f.password "secret"
		f.role "visitor"
	end

	#factory :investor, Class: User do |f|
	#	f.role "investor"
	#end
	#
	#factory :admin, Class: User do |f|
	#	f.role "admin"
	#end
	#
	#factory :super_admin, Class: User do |f|
	#	f.role "super_admin"
	#end

end