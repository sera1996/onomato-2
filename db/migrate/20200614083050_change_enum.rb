class ChangeEnum < ActiveRecord::Migration[5.2]
  def change
    change_column :favors, :dimension_name, :integer
  end
end
