require_relative('../models/students')
require_relative('../models/houses')
require('pry-byebug')

house_1 = House.new({
  "name" => "Gryffindor",
  "logo" => "../images/Gryffindor.jpg"
})

house_2 = House.new({
  "name" => "Ravenclaw",
  "logo" => "../images/Ravenclaw.jpg"
})

house_3 = House.new({
  "name" => "Slytherin",
  "logo" => "../images/Slytherin.jpg"
})

house_4 = House.new({
  "name" => "Hufflepuff",
  "logo" => "../images/Hufflepuff.jpg"
})

house_1.save()
house_2.save()
house_3.save()
house_4.save()





student_1 = Student.new({
  "first_name" => "Harry", 
  "last_name" => "Potter",
  "age"   => 12, 
  "house_id" => house_1.id
})

student_2 = Student.new({
"first_name" => "Tom",
"last_name" => "Roddick",
"age"      => 35,
"house_id"     => house_2.id
})

student_3 = Student.new({
  "first_name" => "Glen",
  "last_name" => "Young",
  "age" => 14,
  "house_id" => house_3.id
  })

student_1.save()
student_2.save()
student_3.save()

binding.pry
nil
