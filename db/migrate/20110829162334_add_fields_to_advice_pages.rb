class AddFieldsToAdvicePages < ActiveRecord::Migration
  def change
    add_column :advice_pages, :title, :string
    add_column :advice_pages, :template, :string
    add_column :advice_pages, :content, :text
  end
end
