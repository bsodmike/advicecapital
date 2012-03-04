class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.float :value
      t.string :month
      t.string :year

      t.timestamps
    end
  end
end
