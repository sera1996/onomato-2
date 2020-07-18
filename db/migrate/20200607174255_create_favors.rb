class CreateFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :favors do |t|
      t.integer :survey_id
      t.integer "sara"
      t.integer "sube"
      t.integer "tsuru"
      t.integer "deko"
      t.integer "gasa"
      t.integer "zara"
      t.integer "fuwa"
      t.integer "buwa"
      t.integer "buyo"
      t.integer "puru"
      t.integer "gunya"
      t.integer "fuka"
      t.integer "funya"
      t.integer "muchi"
      t.integer "gotsu"
      t.integer "gowa"
      t.integer "kachi"
      t.integer "beta"
      t.integer "beto"
      t.integer "becho"
      t.integer "bisho"
      t.integer "bicha"
      t.integer "gusho"
      t.integer "jiku"
      t.integer "boso"
      t.integer "poso"
      t.integer "kasa"
      t.integer "pasa"
      t.integer "neba"
      t.integer "nechi"
      t.integer "neto"
      t.integer "necha"
      t.integer "nume"
      t.integer "nuru"
      t.integer "nyuru"
      t.integer "gito"
      t.timestamps
    end
  end
end
