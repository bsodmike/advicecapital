class AddTypeToInvestor < ActiveRecord::Migration
  def change
  	remove_column :investors, :type, :string
    add_column :investors, :investor_type, :string
  end
end
