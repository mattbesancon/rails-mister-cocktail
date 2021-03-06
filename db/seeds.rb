# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'rest-client'


(0..9).each do |i|
    result = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=1100#{i}")
    response = JSON.parse(result)
    response["drinks"].each do |x|
        cocktail = Cocktail.create(name: x["strDrink"], photo: x["strDrinkThumb"], description: x["strInstructions"], category: x["strCategory"])
        (1..15).each do |j|
            el = x["strIngredient#{j}"]
            if el.nil? == false && Ingredient.find_by_name(el).nil?
                arr = el.split(" ")
                str = arr.join("%20")
                new_ing = Ingredient.create(name: el, photo: "https://www.thecocktaildb.com/images/ingredients/#{str}.png")
                res = RestClient.get("https://www.thecocktaildb.com/api/json/v1/1/search.php?i=#{el}")
                resp = JSON.parse(res)
                if resp["ingredients"][0]["strAlcohol"] == "Yes"
                    new_ing.liquor = true
                    new_ing.save
                end 
                new_dose = Dose.create(description: el, cocktail_id: cocktail.id, ingredient_id: new_ing.id)               
            end
        end
    end
end


