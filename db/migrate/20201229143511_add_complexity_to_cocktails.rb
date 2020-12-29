class AddComplexityToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :complexity, :string
  end
end
