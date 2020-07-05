class RemoveColumnTotalHoursFromLanguage < ActiveRecord::Migration[6.0]
  def change
    remove_column :languages, :total_hours, :integer
  end
end
