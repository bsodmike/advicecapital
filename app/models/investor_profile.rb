class InvestorProfile < ActiveRecord::Base
	validates :investor_id, :uniqueness => true
	validates :user_id, :uniqueness => true

	belongs_to :investor
	belongs_to :user
end
