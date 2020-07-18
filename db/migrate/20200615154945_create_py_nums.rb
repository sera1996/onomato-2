class CreatePyNums < ActiveRecord::Migration[5.2]
  def change
    create_table :py_nums do |t|
      t.text :sentence
      t.text :vocab

      t.timestamps
    end
  end
end
