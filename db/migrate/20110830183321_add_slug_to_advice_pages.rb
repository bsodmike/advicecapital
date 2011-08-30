class AddSlugToAdvicePages < ActiveRecord::Migration
  def change
    add_column :advice_pages, :slug, :string
  end
end
