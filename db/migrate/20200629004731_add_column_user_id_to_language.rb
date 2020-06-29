class AddColumnUserIdToLanguage < ActiveRecord::Migration[6.0]
  def change
    add_column :languages, :user_id, :Integer
  end
end
