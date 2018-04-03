require_relative("../models/ingredient.rb")
require_relative("../models/recipe.rb")
require_relative("../models/recipe_ingredient.rb")
# require("pry-byebug")

Recipe_Ingredient.delete_all()
Ingredient.delete_all()
Recipe.delete_all()

carrot = Ingredient.new({
  "name" => "Carrot"
})
carrot.save()

chicken = Ingredient.new({
  "name" => "Chicken"
})
chicken.save()

onion = Ingredient.new({
  "name" => "Onion"
})
onion.save()

rice = Ingredient.new({
  "name" => "Rice"
})
rice.save()

sweet_potato = Ingredient.new({
  "name" => "Sweet potato"
})
sweet_potato.save()

soup = Recipe.new({
  "name" => "Roasted sweet potato & carrot soup",
  "vegetarian" => true,
  "freezable" => true,
  "difficulty" => "Easy",
  "method" => "Heat oven to 220C/200C fan/ gas 7 and put the sweet potatoes and carrots into a large roasting tin, drizzled with 2 tbsp olive oil and plenty of seasoning. Roast the veg in the oven for 25-30 mins or until caramelised and tender.
  Meanwhile, put the remaining 1 tbsp olive oil in a large deep saucepan and fry the onion over a medium-low heat for about 10 mins until softened. Add the garlic and stir for 1 min before adding the stock. Simmer for 5-10 mins until the onions are very soft, then set aside.
  Once the roasted veg is done, leave to cool a little, then transfer to the saucepan and use a hand blender to process until smooth. Stir in the crème fraîche, a little more seasoning and reheat until hot. Serve in bowls topped with a swirl of crème fraîche and a good grinding of black pepper."
})
soup.save()

jambalaya = Recipe.new({
  "name" => "Chicken & chorizo jambalaya",
  "vegetarian" => false,
  "freezable" => true,
  "difficulty" => "Easy",
  "method" => "Heat the oil in a large frying pan with a lid and brown the chicken for 5-8 mins until golden. Remove and set aside. Tip in the onion and cook for 3-4 mins until soft. Then add the pepper, garlic, chorizo and Cajun seasoning, and cook for 5 mins more.
  Stir the chicken back in with the rice, add the tomatoes and stock. Cover and simmer for 20-25 mins until the rice is tender."
})
jambalaya.save()

recipe_ingredient1 = Recipe_Ingredient.new({
  "ingredient_id" => carrot.id,
  "recipe_id" => soup.id
})
recipe_ingredient1.save()

recipe_ingredient2 = Recipe_Ingredient.new({
  "ingredient_id" => onion.id,
  "recipe_id" => soup.id
})
recipe_ingredient2.save()

recipe_ingredient3 = Recipe_Ingredient.new({
  "ingredient_id" => sweet_potato.id,
  "recipe_id" => soup.id
})
recipe_ingredient3.save()

# binding.pry
# nil
