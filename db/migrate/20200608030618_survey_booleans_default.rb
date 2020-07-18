class SurveyBooleansDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :surveys, :emboss, :boolean, default: false
    change_column :surveys, :favor, :boolean, default: false
    change_column :surveys, :hardness, :boolean, default: false
    change_column :surveys, :wetness, :boolean, default: false
    change_column :surveys, :elastic, :boolean, default: false
    change_column :surveys, :adhesive, :boolean, default: false
    change_column :surveys, :friction, :boolean, default: false
  end
end
