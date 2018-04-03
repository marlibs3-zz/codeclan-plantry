require_relative("../db/sql_runner")

class Ingredient

  attr_reader :id, :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO ingredients
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM ingredients"
    results = SqlRunner.run(sql)
    return results.map { |ingredient| Ingredient.new(ingredient) }
  end

  def self.find(id)
    sql = "SELECT * FROM ingredients
    WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Ingredient.new(results.first)
  end

  def self.delete_all
    sql = "DELETE FROM ingredients"
    SqlRunner.run( sql )
  end

end
