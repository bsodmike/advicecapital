class CreateBoards < ActiveRecord::Migration
  def self.up
    create_table :boards do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :phone
      t.string :image

      t.timestamps
    end
  end

  def self.down
    drop_table :boards
  end
end
