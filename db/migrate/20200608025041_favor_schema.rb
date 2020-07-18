class FavorSchema < ActiveRecord::Migration[5.2]
  def change
    add_column :favors, :dimension_name, :string
  end
end
