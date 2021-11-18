class AddVideoToCocktails < ActiveRecord::Migration[5.2]
  def change
    add_column :cocktails, :video, :string
  end
end
