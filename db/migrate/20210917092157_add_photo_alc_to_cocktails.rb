class AddPhotoAlcToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :photo_alc, :string
  end
end
