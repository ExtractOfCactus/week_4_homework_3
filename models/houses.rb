require_relative('../db/sql_runner')

class House
  attr_reader :id, :name, :logo

  def initialize (options)
    @id = options['id'].to_i
    @name = options['name']
    @logo = options['logo']
  end

  def save()
    sql = "INSERT INTO houses (name, logo) VALUES ('#{@name}', '#{@logo}')
     RETURNING *;"
     a = SqlRunner.run(sql)
     @id = a.first()['id'].to_i
  end

  def House.all()
    sql = "SELECT * FROM houses"
    houses_data = SqlRunner.run(sql)
    result = houses_data.map { |house| House.new(house) }
    return result
  end

  def House.find(id)
    sql = "SELECT * FROM houses WHERE id = #{id};"
    houses = SqlRunner.run(sql) 
    result = House.new(houses.first())
    return result
  end

end