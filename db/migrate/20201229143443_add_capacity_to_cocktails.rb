class AddCapacityToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :capacity, :string
  end
end
