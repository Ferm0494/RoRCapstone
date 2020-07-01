class RemoveColumnDescriptionFromLanguage < ActiveRecord::Migration[6.0]
  def change
    remove_column :languages, :description, :string
  end
end
