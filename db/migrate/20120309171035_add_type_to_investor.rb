class AddTypeToInvestor < ActiveRecord::Migration
  def change
  	remove_column :investors, :type
    add_column :investors, :investor_type, :string
  end
end
