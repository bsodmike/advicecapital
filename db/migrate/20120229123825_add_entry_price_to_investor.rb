class AddEntryPriceToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :entry_price, :integer

  end
end
