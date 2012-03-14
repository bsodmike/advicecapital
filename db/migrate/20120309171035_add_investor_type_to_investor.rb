class AddInvestorTypeToInvestor < ActiveRecord::Migration
  def self.up
    add_column :investors, :investor_type, :string
  end

  def self.down
  	remove_column :investors, :investor_type
  end
end
