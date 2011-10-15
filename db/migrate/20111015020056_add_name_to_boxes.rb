class AddNameToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :name, :string
  end
end
