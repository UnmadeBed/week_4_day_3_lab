require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry' )

require_relative( './models/student' )
require_relative( './models/house')
also_reload( './models/*' )

get '/students' do
  @students = Student.all
  erb(:index)
end

# # Get - designed to provide information before edit.

get '/students/new' do # new
  @houses = House.all
  erb( :new )
end

get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

get '/students/:id/edit' do
  @students = Student.find(params[:id])
  erb(:edit)
end

# # Updates - alter information on db.
#
# post '/all_students/:id' do
#   @students = Student.new(params)
#   @students.update
#   redirect to('/all_students')
# end

  post '/students' do
  @students = Student.new( params )
  @students.save()
  erb( :create )
end

# post '/all_students/:id/delete' do
#   @students = Student.find(params[:id])
#   @students.delete()
#   redirect to('/all_students')
