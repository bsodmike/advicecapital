class RemoveStocksFromInvestors < ActiveRecord::Migration
  def up
  	remove_column :investors, :stocks
  end

  def down
  end
end
