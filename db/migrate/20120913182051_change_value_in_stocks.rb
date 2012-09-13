class ChangeValueInStocks < ActiveRecord::Migration
  def change
  	change_column :stocks, :value, :decimal, :precision => 6, :scale => 2
  end
end
