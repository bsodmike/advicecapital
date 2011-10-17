class AddPhoneToInvestors < ActiveRecord::Migration
  def change
    add_column :investors, :phone, :integer
  end
end
