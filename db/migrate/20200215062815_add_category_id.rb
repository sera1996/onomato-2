class AddCategoryId < ActiveRecord::Migration[5.2]
  def change
    add_column :onomatopoeia, :category_id, :integer
  end
end
