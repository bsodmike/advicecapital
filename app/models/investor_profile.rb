class InvestorProfile < ActiveRecord::Base
  attr_accessible :investor_id, :user_id
  
	validates :investor_id, :uniqueness => true
	validates :user_id, :uniqueness => true

	belongs_to :investor
	belongs_to :user
end
