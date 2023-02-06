def input_students
  puts "Please enter the details of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  continue = true

  while continue
    puts "Please enter the name"
    name = gets.chomp

    if name.empty?
      continue = false
    else
      puts "Please enter your country of birth"
      country = gets.chomp
      puts "Please enter your favourite hobby"
      hobby = gets.chomp

      #enter info into array
      students << {
        name: name,
        cohort: :november,
        country: country,
        hobby: hobby,
      }

      puts "Now we have #{students.count} students"
    end
  end
  #return the array of students
  students
end

#print students whose name begins with specific letter
def print_students_specific_letter(students, letter)
  students.each do |student|
    puts "#{student[:name]}" if student[:name][0] == letter
  end
end

#print students names shorter than 12 characters
def print_students_twelve_characters(students)
  students.each do |student|
    puts "#{student[:name]}" if student[:name].length <= 11
  end
end

#loop to print all students
def print_students(students)
  index = 0
  while index < students.length
    puts "#{students[index][:name]} (#{students[index][:cohort]} cohort)"
    index += 1
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
print_students(students)
#print_students_twelve_characters(students)
#print_header
#print(students)
#print_footer(students)
