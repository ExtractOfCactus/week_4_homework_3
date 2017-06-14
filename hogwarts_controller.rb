require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('models/students')

#INDEX
get "/students" do
  @students = Student.all()
  erb(:index_students)
end

#NEW
get "/students/new" do 
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
