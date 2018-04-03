require_relative("../db/sql_runner")

class Recipe_Ingredient

  attr_reader :id, :ingredient_id, :recipe_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @ingredient_id = options['ingredient_id'].to_i
    @recipe_id = options['recipe_id'].to_i
  end

  def save()
    sql = "INSERT INTO recipe_ingredients
    (
      ingredient_id,
      recipe_id
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@ingredient_id, @recipe_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM recipe_ingredients"
    results = SqlRunner.run(sql)
    return results.map { |recipe_ingredient| Recipe_Ingredient.new(recipe_ingredient) }
  end

  def ingredient()
    sql = "SELECT * FROM ingredients
    WHERE id = $1"
    values = [@ingredient_id]
    results = SqlRunner.run(sql, values)
    return Ingredient.new(results.first)
  end

  def recipe()
    sql = "SELECT * FROM recipes
    WHERE id = $1"
    values = [@recipe_id]
    results = SqlRunner.run(sql, values)
    return Recipe.new(results.first)
  end

  def self.delete(id)
    sql = "DELETE FROM recipe_ingredients
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.delete_all
    sql = "DELETE FROM recipe_ingredients"
    SqlRunner.run( sql )
  end

end
