class AddFrontpageToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :frontpage, :boolean

    add_index :videos, :frontpage, :unique => true
  end
end
