class CreateOnomatopoeia < ActiveRecord::Migration[5.2]
  def change
    create_table :onomatopoeia do |t|
      t.text :name

      t.timestamps
    end
  end
end
