DROP TABLE IF EXISTS recipe_ingredients;
DROP TABLE IF EXISTS ingredients;
DROP TABLE IF EXISTS recipes;

CREATE TABLE ingredients
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  plural_name VARCHAR(255)
);

CREATE TABLE recipes
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  vegetarian BOOLEAN,
  freezable BOOLEAN,
  difficulty VARCHAR(255),
  method VARCHAR
);

CREATE TABLE recipe_ingredients
(
  id SERIAL8 PRIMARY KEY,
  ingredient_id INT8 REFERENCES ingredients(id),
  recipe_id INT8 REFERENCES recipes(id)
);
