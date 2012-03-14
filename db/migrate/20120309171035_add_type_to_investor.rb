class AddTypeToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :investor_type, :string

  end
end
