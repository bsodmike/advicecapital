class AddTypeToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :type, :string

  end
end
