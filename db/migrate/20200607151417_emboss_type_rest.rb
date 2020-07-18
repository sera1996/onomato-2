class EmbossTypeRest < ActiveRecord::Migration[5.2]
  def change
    change_column :embosses, :sube, :integer
    change_column :embosses, :tsuru, :integer
  end
end
