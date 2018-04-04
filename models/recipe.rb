require_relative("../db/sql_runner")

class Recipe

  attr_reader :id
  attr_accessor :name, :image, :difficulty, :vegetarian, :freezable, :method

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @image = options['image']
    @difficulty = options['difficulty']
    @vegetarian = options['vegetarian']
    @freezable = options['freezable']
    @method = options['method']
  end

  def save()
    sql = "INSERT INTO recipes
    (
      name,
      image,
      difficulty,
      vegetarian,
      freezable,
      method
    )
    VALUES
    (
      $1, $2, $3, $4, $5, $6
    )
    RETURNING id"
    values = [@name, @image, @difficulty, @vegetarian, @freezable, @method]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# return ingredients array for this recipe
  def ingredients()
    sql = "SELECT ing.*
    FROM ingredients ing
    INNER JOIN recipe_ingredients rec
    ON rec.ingredient_id = ing.id
    WHERE rec.recipe_id = $1;"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map { |ingredient| Ingredient.new(ingredient) }
  end

  def self.all()
    sql = "SELECT * FROM recipes"
    results = SqlRunner.run(sql)
    return results.map { |recipe| Recipe.new(recipe) }
  end

  def self.find(id)
    sql = "SELECT * FROM recipes
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Recipe.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM recipes"
    SqlRunner.run( sql )
  end

  def add_ingredients_by_id(array_of_ingredient_ids)
    for ingredient_id in array_of_ingredient_ids
      new_relationship_hash = {
        "ingredient_id" => ingredient_id,
        "recipe_id" => @id
      }
      Recipe_Ingredient.new(new_relationship_hash).save()
    end

  end

end
