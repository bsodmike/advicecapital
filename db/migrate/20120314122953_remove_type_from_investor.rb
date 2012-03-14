class RemoveTypeFromInvestor < ActiveRecord::Migration
  def up
    remove_column :investors, :type
  end

  def down
    add_column :investors, :type, :string
  end
end
