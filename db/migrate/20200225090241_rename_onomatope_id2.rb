class RenameOnomatopeId2 < ActiveRecord::Migration[5.2]
  def change
     rename_column :samples, :onomatopoeia_id, :onomatopoeium_id
  end
end
