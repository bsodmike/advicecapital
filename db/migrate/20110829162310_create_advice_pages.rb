class CreateAdvicePages < ActiveRecord::Migration
  def self.up
    create_table :advice_pages do |t|
      t.string :title
      t.string :template
      t.text :content
      
      t.timestamps
    end
  end

  def self.down
    drop_table :advice_pages
  end
end
