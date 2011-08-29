class CreateAdvicePages < ActiveRecord::Migration
  def self.up
    create_table :advice_pages
  end

  def self.down
    drop_table :advice_pages
  end
end
