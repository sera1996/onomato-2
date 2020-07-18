class RenameOnomatopeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :samples, :onomatopoeia_id, :onomatopoeia_id
  end
end
