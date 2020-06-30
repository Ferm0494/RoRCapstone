class AddColumnLanguageIdToFramework < ActiveRecord::Migration[6.0]
  def change
    add_column :frameworks, :language_id, :integer
  end
end
