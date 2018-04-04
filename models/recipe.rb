require_relative("../db/sql_runner")

class Recipe

  attr_reader :id, :name, :vegetarian, :freezable, :difficulty, :method

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @vegetarian = options['vegetarian']
    @freezable = options['freezable']
    @difficulty = options['difficulty']
    @method = options['method']
  end

  def save()
    sql = "INSERT INTO recipes
    (
      name,
      vegetarian,
      freezable,
      difficulty,
      method
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @vegetarian, @freezable, @difficulty, @method]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

# return ingredients array for this recipe
  def ingredients()
    sql = "SELECT ing.*
    FROM ingredients ing
    INNER JOIN recipe_ingredients rec
    ON rec.ingredient_id = ing.id
    WHERE rec.ingredient_id = $1;"
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

end
