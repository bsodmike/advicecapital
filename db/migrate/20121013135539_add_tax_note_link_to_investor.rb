class AddTaxNoteLinkToInvestor < ActiveRecord::Migration
  def change
    add_column :investors, :tax_note_link, :string
  end
end
