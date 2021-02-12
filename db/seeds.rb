# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'

10.times {
    result = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/random.php')
    response = JSON.parse(result)
    response["drinks"].each do |x|
        cocktail = Cocktail.create(name: x["strDrink"], photo: x["strDrinkThumb"], description: x["strInstructions"], category: x["strCategory"])
        (1..15).each do |i|
            if x["strIngredient#{i}"] != nil
                new_ing = Ingredient.create(name: x["strIngredient#{i}"])
                new_dose = Dose.create(description: x["strMeasure#{i}"], cocktail_id: cocktail.id, ingredient_id: new_ing.id)
            end
        end
    end
}
