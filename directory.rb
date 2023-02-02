#first we print the list of students

students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Racthed",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates",
]

#and then print them
puts "The students of Villains Academy"
puts "-------------"

students.each { |student| puts student }

#finally we print the total number of students
puts "Overall we have #{students.count} great students"
