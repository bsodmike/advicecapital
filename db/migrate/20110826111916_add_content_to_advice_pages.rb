class AddContentToAdvicePages < ActiveRecord::Migration
  def change
    add_column :advice_pages, :content, :string
  end
end
