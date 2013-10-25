# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Student.create(:email => 'foobar@gmail.com', :password => '1234foo', :password_confirmation => '1234foo')
student = Student.find_by_email('foobar@gmail.com')
courses = [
	["CSC309H1", "Intro to Web Programming"],
	["CSC301H1", "Intro to Software Engineering"],
	["CSC369H1", "Intro to Operating Systems"]
]
assignments = [
	["A1", 10, Date.current + 1.week, Date.current+4.weeks],
	["A2", 10, Date.current + 4.week, Date.current+7.weeks],
	["A3", 10, Date.current + 7.week, Date.current+9.weeks],
	["A4", 10, Date.current + 9.week, Date.current+12.weeks],
	["A5", 10, Date.current + 12.week, Date.current+14.weeks]
]

courses.each do |c| 
	course = student.courses.build({"title"=>c[0], "name"=>c[1], 
		"startDate" => Date.current, "endDate" => Date.current + 4.months})
	assignments.each do |a|
		assignment = course.assessments.build({:name => a[0], :weight => a[1], :start_at => a[2], :end_at => a[3]})
		assignment.type = "Assignment"
	end
	course.save

end

student.save