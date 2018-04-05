require_relative("../models/ingredient.rb")
require_relative("../models/recipe.rb")
require_relative("../models/recipe_ingredient.rb")
require("pry-byebug")

Recipe_Ingredient.delete_all()
Ingredient.delete_all()
Recipe.delete_all()

carrot = Ingredient.new({
  "name" => "Carrot",
  "plural_name" => "Carrots"
})
carrot.save()

chicken = Ingredient.new({
  "name" => "Chicken",
  "plural_name" => "Chicken"
})
chicken.save()

onion = Ingredient.new({
  "name" => "Onion",
  "plural_name" => "Onions"
})
onion.save()

rice = Ingredient.new({
  "name" => "Rice",
  "plural_name" => "Rice"
})
rice.save()

sweet_potato = Ingredient.new({
  "name" => "Sweet potato",
  "plural_name" => "Sweet potatoes"
})
sweet_potato.save()

pork = Ingredient.new({
  "name" => "Pork",
  "plural_name" => "Pork"
})
pork.save()

mushrooms = Ingredient.new({
  "name" => "Mushrooms",
  "plural_name" => "Mushrooms"
})
mushrooms.save()

chorizo = Ingredient.new({
  "name" => "Chorizo",
  "plural_name" => "Chorizo"
})
chorizo.save()

soup = Recipe.new({
  "name" => "Roasted sweet potato & carrot soup",
  "image" => "http://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/user-collections/my-colelction-image/2015/12/roasted-sweet-potato-carrot-soup.jpg?itok=l_XQY-PR",
  "vegetarian" => true,
  "freezable" => true,
  "difficulty" => "Medium",
  "method" => "Heat oven to 220C/200C fan/ gas 7 and put the sweet potatoes and carrots into a large roasting tin, drizzled with 2 tbsp olive oil and plenty of seasoning. Roast the veg in the oven for 25-30 mins or until caramelised and tender.
  Meanwhile, put the remaining 1 tbsp olive oil in a large deep saucepan and fry the onion over a medium-low heat for about 10 mins until softened. Add the garlic and stir for 1 min before adding the stock. Simmer for 5-10 mins until the onions are very soft, then set aside.
  Once the roasted veg is done, leave to cool a little, then transfer to the saucepan and use a hand blender to process until smooth. Stir in the crème fraîche, a little more seasoning and reheat until hot. Serve in bowls topped with a swirl of crème fraîche and a good grinding of black pepper."
})
soup.save()

chicken_jambalaya = Recipe.new({
  "name" => "Chicken & chorizo jambalaya",
  "image" => "http://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/user-collections/my-colelction-image/2015/12/recipe-image-legacy-id--1274503_8.jpg?itok=y2r-R0BV",
  "vegetarian" => false,
  "freezable" => true,
  "difficulty" => "Easy",
  "method" => "Heat the oil in a large frying pan with a lid and brown the chicken for 5-8 mins until golden. Remove and set aside. Tip in the onion and cook for 3-4 mins until soft. Then add the pepper, garlic, chorizo and Cajun seasoning, and cook for 5 mins more.
  Stir the chicken back in with the rice, add the tomatoes and stock. Cover and simmer for 20-25 mins until the rice is tender."
})
chicken_jambalaya.save()

pork_pan_fry = Recipe.new({
  "name" => "Pork pan-fry",
  "image" => "http://www.bbcgoodfood.com/sites/default/files/styles/recipe/public/recipe_images/recipe-image-legacy-id--4491_12.jpg?itok=rxoin0l7",
  "vegetarian" => false,
  "freezable" => false,
  "difficulty" => "Easy",
  "method" => "Coat the pork: Cut the pork diagonally into finger-thick slices. Tip the flour and rosemary into a large plastic food bag, add some salt and pepper and the pork, and toss until the meat is well coated.
  Start cooking: Heat 2 tablespoons of the oil in a large wide frying pan. Add the pork and fry for about 3-4 minutes until nicely browned on both sides, turning once. Remove from the pan.
  Fry the mushrooms: Heat the remaining oil in the pan, tip in the mushrooms and fry until they start to soften, about 2 minutes. Sprinkle in the garlic and return the pork to the pan with any flour left in the bag. Stir in the stock and bring to the boil. Simmer for 5 minutes or until the pork is cooked."
})
pork_pan_fry.save()

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

recipe_ingredient4 = Recipe_Ingredient.new({
  "ingredient_id" => chicken.id,
  "recipe_id" => chicken_jambalaya.id
})
recipe_ingredient4.save()

recipe_ingredient5 = Recipe_Ingredient.new({
  "ingredient_id" => chorizo.id,
  "recipe_id" => chicken_jambalaya.id
})
recipe_ingredient5.save()

recipe_ingredient6 = Recipe_Ingredient.new({
  "ingredient_id" => rice.id,
  "recipe_id" => chicken_jambalaya.id
})
recipe_ingredient6.save()

recipe_ingredient7 = Recipe_Ingredient.new({
  "ingredient_id" => pork.id,
  "recipe_id" => pork_pan_fry.id
})
recipe_ingredient7.save()

recipe_ingredient8 = Recipe_Ingredient.new({
  "ingredient_id" => mushrooms.id,
  "recipe_id" => pork_pan_fry.id
})
recipe_ingredient8.save()

recipe_ingredient9 = Recipe_Ingredient.new({
  "ingredient_id" => onion.id,
  "recipe_id" => pork_pan_fry.id
})
recipe_ingredient9.save()
