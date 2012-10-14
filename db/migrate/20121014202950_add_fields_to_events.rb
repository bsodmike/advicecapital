class AddFieldsToEvents < ActiveRecord::Migration
  def change
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
    add_column :events, :allDay, :boolean
  end
end
