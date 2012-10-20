class RemoveInvestorProfiles < ActiveRecord::Migration
  def up
		drop_table :investor_profiles
  end

  def down
  end
end
