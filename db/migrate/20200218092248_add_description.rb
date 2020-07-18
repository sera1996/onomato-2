class AddDescription < ActiveRecord::Migration[5.2]
  def change
    add_column :onomatopoeia, :description, :text
  end
end
