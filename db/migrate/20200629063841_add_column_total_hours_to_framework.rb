class AddColumnTotalHoursToFramework < ActiveRecord::Migration[6.0]
  def change
    add_column :frameworks, :total_hours, :Integer
  end
end
