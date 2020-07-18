class AddKana < ActiveRecord::Migration[5.2]
  def change
    add_column :onomatopoeia, :kana, :text
  end
end
