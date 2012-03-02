class AddCurrentRateToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :current_rate, :float

  end
end
