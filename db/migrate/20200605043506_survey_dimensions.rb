class SurveyDimensions < ActiveRecord::Migration[5.2]
  def change
    add_column :survey, :emboss, :boolean
    add_column :survey, :favor, :boolean
    add_column :survey, :hardness, :boolean
    add_column :survey, :wetness, :boolean
    add_column :survey, :elastic, :boolean
    add_column :survey, :adhesive, :boolean
    add_column :survey, :friction, :boolean

  end
end
