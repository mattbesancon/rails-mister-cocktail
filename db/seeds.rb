# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'

30.times {
    result = RestClient.get('https://www.thecocktaildb.com/api/json/v1/1/random.php')
    response = JSON.parse(result)
    response["drinks"].each do |x|
        cocktail = Cocktail.create(name: x["strDrink"], photo: x["strDrinkThumb"], description: x["strInstructions"], category: x["strCategory"])
        ingredient1 = Ingredient.create(name: x["strIngredient1"])
        dose1 = Dose.create(description: x["strMeasure1"], cocktail_id: cocktail.id, ingredient_id: ingredient1.id)
        ingredient2 = Ingredient.create(name: x["strIngredient2"])
        dose2 = Dose.create(description: x["strMeasure2"], cocktail_id: cocktail.id, ingredient_id: ingredient2.id)
        ingredient3 = Ingredient.create(name: x["strIngredient3"])
        dose3 = Dose.create(description: x["strMeasure3"], cocktail_id: cocktail.id, ingredient_id: ingredient3.id)
    end
}
