class EmbossTypeAll < ActiveRecord::Migration[5.2]
  def change
    change_column :embosses, :deko, :integer
    change_column :embosses, :gasa, :integer
    change_column :embosses, :zara, :integer
    change_column :embosses, :fuwa, :integer
    change_column :embosses, :buwa, :integer
    change_column :embosses, :buyo, :integer
    change_column :embosses, :puru, :integer
    change_column :embosses, :gunya, :integer
    change_column :embosses, :fuka, :integer
    change_column :embosses, :funya, :integer
    change_column :embosses, :muchi, :integer
    change_column :embosses, :gotsu, :integer
    change_column :embosses, :gowa, :integer
    change_column :embosses, :kachi, :integer
    change_column :embosses, :beta, :integer
    change_column :embosses, :beto, :integer
    change_column :embosses, :becho, :integer
    change_column :embosses, :bisho, :integer
    change_column :embosses, :bicha, :integer
    change_column :embosses, :gusho, :integer
    change_column :embosses, :jiku, :integer
    change_column :embosses, :boso, :integer
    change_column :embosses, :poso, :integer
    change_column :embosses, :kasa, :integer
    change_column :embosses, :pasa, :integer
    change_column :embosses, :neba, :integer
    change_column :embosses, :nechi, :integer
    change_column :embosses, :neto, :integer
    change_column :embosses, :necha, :integer
    change_column :embosses, :nume, :integer
    change_column :embosses, :nuru, :integer
    change_column :embosses, :nyuru, :integer
    change_column :embosses, :gito, :integer
  
  end
end
