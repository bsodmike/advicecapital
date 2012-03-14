class AddInvestorTypeToInvestor < ActiveRecord::Migration
  def up
    add_column :investors, :investor_type, :string
  end

  def down
  	remove_column :investors, :investor_type
  end
end
