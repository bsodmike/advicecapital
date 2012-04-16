class CreatePageTranslations < ActiveRecord::Migration
  def up
    AdvicePage.create_translation_table!({
      title: :string,
      content: :text
    }, {
      migrate_data: true
    })
  end

  def down
    AdvicePage.drop_translation_table! migrate_data: true
  end
end
