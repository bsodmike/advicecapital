class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.integer :value
      t.integer :month
      t.integer :year

      t.timestamps
    end
  end
end
