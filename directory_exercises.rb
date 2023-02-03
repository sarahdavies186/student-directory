def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty?
    #add the student hash to the array
    students << { name: name, cohort: :november }
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

#method to print students whose name begins with specific letter
def print_students_specific_letter(students, letter)
  students.each do |student|
    puts "#{student[:name]}" if student[:name][0] == letter
  end
end

#method to print students names shorter than 12 characters
def print_students_twelve_characters(students)
  students.each do |student|
    puts "#{student[:name]}" if student[:name].length <= 11
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall we have #{students.count} great students"
end

#nothing happens until we call the methods

students = input_students
print_students_twelve_characters(students)
#print_header
#print(students)
#print_footer(students)
