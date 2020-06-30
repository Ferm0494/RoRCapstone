class RemoveColumnTotalFrameworksFromLanguage < ActiveRecord::Migration[6.0]
  def change
    remove_column :languages, :total_frameworks, :integer
  end
end
