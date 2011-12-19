class Stock < ActiveRecord::Base
	belongs_to :investor, through: :investor_stock
end
