class AddComplexityToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :complexity, :string, default: "medium"
  end
end
