class AddLiquorToIngredients < ActiveRecord::Migration[5.2]
  def change
    add_column :ingredients, :liquor, :boolean
  end
end
