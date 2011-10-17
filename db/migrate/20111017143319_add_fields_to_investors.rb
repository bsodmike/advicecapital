class AddFieldsToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :stocks, :integer
    add_column :investors, :entry_date, :datetime
    add_column :investors, :entry_stock_price, :integer
  end
end
