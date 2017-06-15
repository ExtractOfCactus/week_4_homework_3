require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/students')
require_relative('models/houses')

#INDEX
get "/students" do
  @students = Student.all()
  erb(:index_students)
end

#NEW
get "/students/new" do 
  @houses = House.all()
  erb(:new)
end

#CREATE
post "/students" do
  @student = Student.new(params)
  @student.save()
erb(:create)
end

#INDEX
get "/houses" do
  @houses = House.all()
  erb(:index_houses)
end

