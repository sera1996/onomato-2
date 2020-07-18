class SurveyBooleans < ActiveRecord::Migration[5.2]
  def change
    add_column :surveys, :emboss, :boolean
    add_column :surveys, :favor, :boolean
    add_column :surveys, :hardness, :boolean
    add_column :surveys, :wetness, :boolean
    add_column :surveys, :elastic, :boolean
    add_column :surveys, :adhesive, :boolean
    add_column :surveys, :friction, :boolean
  end
end
