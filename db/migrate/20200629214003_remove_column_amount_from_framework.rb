class RemoveColumnAmountFromFramework < ActiveRecord::Migration[6.0]
  def change
    remove_column :frameworks, :amount, :integer
  end
end
