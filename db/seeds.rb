require 'json'
require 'open-uri'

puts 'Creating some Ingredient...'

Dose.destroy_all
Ingredient.destroy_all
Cocktail.destroy_all

ingredient_serialized = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read

ingredient = JSON.parse(ingredient_serialized)
ingredient['drinks'].each do |drink|
  ingredient_name = drink['strIngredient1']
  Ingredient.create(name: ingredient_name)
end

puts 'Done!'
