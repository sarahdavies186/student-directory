@students = [] #an empty array accessible to all methods
@filename = "students.csv"

def input_students
  puts "Please enter the names of the students. To finish, just hit return twice"
  while name = STDIN.gets.chomp
    break if name.empty?
    @students << { name: name, cohort: :november }
    puts "Now we have #{@students.count} students"
  end
end

def choose_file
  puts "What file would you like to use? Type 1 for students.csv"
  file_choice = STDIN.gets.chomp
  if file_choice == "1"
    @filename = "students.csv"
  else
    @filename = file_choice
  end
end

def save_students
  choose_file
  file = File.open(@filename, "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]].join(",")
    file.puts student_data
  end
  file.close
end

def load_students
  choose_file
  file = File.open(@filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << { name: name, cohort: cohort.to_sym }
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    puts "You chose to enter the students details"
    students = input_students
  when "2"
    puts "You chose to see a list of the students"
    show_students
  when "3"
    save_students
    puts "You have saved the list of students"
  when "4"
    load_students
    puts "You have loaded the list of students"
  when "9"
    puts "Bye!"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall we have #{@students.count} great students"
end

#nothing happens until we call the methods

try_load_students
interactive_menu
