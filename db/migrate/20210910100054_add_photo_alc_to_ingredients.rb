class AddPhotoAlcToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :photo_alc, :string
  end
end
