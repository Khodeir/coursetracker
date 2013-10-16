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

courses.each do |c| 
	student.courses.build({"title"=>c[0], "name"=>c[1], 
		"startDate" => Date.current, "endDate" => Date.current + 4.months})
end
student.save