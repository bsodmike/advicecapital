class CreateBoxTranslations < ActiveRecord::Migration
  def up
    Box.create_translation_table!({
      name: :string,
      content: :text
    }, {
      migrate_data: true
    })
  end

  def down
    Box.drop_translation_table! migrate_data: true
  end
  
end
