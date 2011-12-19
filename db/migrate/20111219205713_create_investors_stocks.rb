class CreateInvestorsStocks < ActiveRecord::Migration
  def change
    create_table :investors_stocks do |t|
      t.integer :investors
      t.integer :stocks

      t.timestamps
    end
  end
end
