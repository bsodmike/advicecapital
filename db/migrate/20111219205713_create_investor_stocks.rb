class CreateInvestorStocks < ActiveRecord::Migration
  def change
    create_table :investor_stocks do |t|
      t.integer :investor_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
