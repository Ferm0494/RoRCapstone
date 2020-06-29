class AddColumnTotalFrameworksToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :total_frameworks, :Integer
  end
end
