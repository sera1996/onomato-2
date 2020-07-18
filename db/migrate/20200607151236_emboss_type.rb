class EmbossType < ActiveRecord::Migration[5.2]
  def change
    change_column :embosses, :sara, :integer
  end
end
