class CreateInvestorProfiles < ActiveRecord::Migration
  def self.up
    create_table :investor_profiles do |t|
      t.integer :investor_id
      t.integer :user_id

      t.timestamps
    end

    add_index :investor_profiles, :investor_id, :unique => true
    add_index :investor_profiles, :user_id, :unique => true
  end

  def self.down
  	drop_table :investor_profiles
  end
end
