#SaraGorecki_assessment.rb

#1. Arrays
array = ["Blake", "Ashley", "Jeff"]

array << "Morgan"
puts array.join(", ")
array[1]
array.index("Jeff")



#2. Hashes
instructor = {:name=>"Ashley", :age=>27}

instructor[:location] = "NYC"

instructor.each do |key,value|
	puts "#{key}: #{value}"
end

instructor[:name]
instructor.key(27)



#3. Nested Structures
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

school[:founded_in] = 2013
school[:students] << {:name => "Mary", :grade => "B"}

school[:students].each do |student|
	if student[:name] == "Billy"
		school[:students].delete(student)
	end
end

school[:students].each do |student|
	student["semester"] = "Summer"
end

school[:instructors].each do |instructor|
	if instructor[:name] == "Ashley"
		instructor[:subject] = "being almost better than Blake"
	end
end

school[:students].each do |student|
	if student[:name] == "Frank" && student[:grade] == "A"
		student[:grade] = "F"
	end
end

b_students = []
school[:students].each do|student| 
	if student[:grade]=="B" 
		b_students << student[:name]
	end
end
b_students

jeff_subj = ""
school[:instructors].each do |instructor|
	if instructor[:name] == "Jeff"
		jeff_subj << instructor[:subject]
	end
end
jeff_subj



#4. Methods
school = { 
  :name => "Happy Funtime School",
  :location => "NYC",
  :instructors => [ 
    {:name=>"Blake", :subject=>"being awesome" },
    {:name=>"Ashley", :subject=>"being better than blake"},
    {:name=>"Jeff", :subject=>"karaoke"}
  ],
  :students => [ 
    {:name => "Marissa", :grade => "B"},
    {:name=>"Billy", :grade => "F"},
    {:name => "Frank", :grade => "A"},
    {:name => "Sophie", :grade => "C"}
  ]
}

def grades(school, name)
    school[:students].each do |student|
		if student[:name] == name
			return student[:grade]
		end
	end
end
grades(school, "Sophie")

def new_subject(school, name, new_subj)
	school[:instructors].each do |instructor|
		if instructor[:name] == name
			instructor[:subject] = new_subj
		end
	end
end
new_subject(school, "Blake", "being terrible")

def new_student(school, name, grade)
	school[:students] << {:name => name, :grade => grade}
end
new_student(school, "Sara", "A")

def new_key(school, key, value)
	school[key.to_sym] = value
end
new_key(school, "Ranking", 1)



#5. Object Orientation
class School
	attr_accessor :name, :location, :students, :instructors
	attr_reader :ranking

	SCHOOLS = []

	def reset
		SCHOOLS.clear
	end

	def initialize(name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		SCHOOLS << self
	end

	def set_rank(rank)
		@ranking = rank
	end

	def add_student(name, grade, semester)
		@students << {:name => name, :grade => grade, :semester => semester}
	end

	def remove_student(name)
		@students.each do |student|
			if student[:name] == name
				@students.delete(student)
			end
		end
	end
end



#6. Classes
class Student
	attr_reader :name, :grade, :semester

	def initialize(name, grade, semester)
		@name = name
		@grade = grade
		@semester = semester
	end
end

class School
	attr_accessor :name, :location, :students, :instructors
	attr_reader :ranking

	SCHOOLS = []

	def reset
		SCHOOLS.clear
	end

	def initialize(name, location, ranking, students, instructors)
		@name = name
		@location = location
		@ranking = ranking
		@students = students
		@instructors = instructors
		SCHOOLS << self
	end

	def set_rank(rank)
		@ranking = rank
	end

	def add_student(name, grade, semester)
		@students << Student.new(name, grade, semester)
	end

	def find_student(name)
		@students.each do |person|
			if person.name == name
				return person
			end
		end
	end

	def remove_student(name)
		@students.each do |student|
			if student.name == name
				@students.delete(student)
			end
		end
	end
end



#7. Self
#a.
"hello"
"Student"     #I didn't realize Student would also be printed, discovered by putting the code into IRB.

#b.
"Student"

#c.
"#<Student:Object_ID>"  #I thought it would only print "Student", until I ran the code.

#d.
"#<Student:Object_ID>"
"#<Student:Object_ID>"  #Forgot about the Object ID until after I ran the code, and didn't realize it would print twice

#e.
"#<Student:Object_ID>"
"goodbye"


















