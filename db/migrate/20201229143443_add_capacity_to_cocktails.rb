class AddCapacityToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :capacity, :string, default: "medium"
  end
end
