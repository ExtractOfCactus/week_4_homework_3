require_relative('../db/sql_runner')

class Student
  attr_reader :first_name, :last_name, :age, :house_id, :id

  def initialize (options)
    @id = options['id'].to_i
    @first_name = options['first_name']
    @last_name = options['last_name']
    @age = options['age'].to_i
    @house_id = options['house_id'].to_i
  end

  def save()
    sql = "INSERT INTO students (first_name, last_name, age, house_id) VALUES ('#{@first_name}', '#{@last_name}', '#{@age}', '#{@house_id}')
     RETURNING *;"
     a = SqlRunner.run(sql)
     @id = a.first()['id'].to_i
  end

  def house()
    sql = "SELECT houses.* FROM houses WHERE id = #{@house_id}"
    result = SqlRunner.run(sql)
    house_data = result[0]
    house = House.new(house_data)
    return house
  end



  def Student.all()
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    result = students.map { |student| Student.new(student) }
    return result
  end

  def Student.find(id)
    sql = "SELECT * FROM students WHERE id = #{id};"
    students = SqlRunner.run(sql) 
    result = Student.new(students.first())
    return result
  end

  # def pretty_name()
  #   return "#{@first_name} #{@last_name}"
  # end



end 