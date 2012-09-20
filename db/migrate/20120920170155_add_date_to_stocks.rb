class AddDateToStocks < ActiveRecord::Migration
  def change
    add_column :stocks, :date, :datetime
  end
end
