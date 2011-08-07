class CreateAdvicePages < ActiveRecord::Migration
  def self.up
    create_table :advice_pages do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :advice_pages
  end
end
