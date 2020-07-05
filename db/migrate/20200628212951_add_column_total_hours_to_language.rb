class AddColumnTotalHoursToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :total_hours, :Integer
  end
end
