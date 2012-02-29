class AddEntryRateToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :entry_rate, :float

  end
end
