class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.text :content

      t.timestamps
    end
  end
end
