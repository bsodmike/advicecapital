class CreateInvestorsStocks < ActiveRecord::Migration
  def change
    create_table :investors_stocks do |t|
      t.integer :investor_id
      t.integer :stock_id

      t.timestamps
    end
  end
end
