class CreateCompanyStocks < ActiveRecord::Migration
  def change
    create_table :company_stocks do |t|
      t.float :primo
      t.float :ultimo

      t.timestamps
    end
  end
end
