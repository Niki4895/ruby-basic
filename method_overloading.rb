# Default OOPs concept of method overloading
# class User
#   def subject(sub1)
#     puts "User had only One Subject - #{sub1}"
#   end

#   def subject(sub1, sub2)
#     puts "User had Two Subject - #{sub1} and #{sub2}"
#   end

#   def subject(sub1, sub2, sub3)
#     puts "User had Three Subject - #{sub1}, #{sub3}, and #{sub2}"
#   end
# end

# user = User.new
# user.subject('Maths') # wrong number of arguments (given 1, expected 3) (ArgumentError)
# user.subject('Maths', 'English') # wrong number of arguments (given 1, expected 3) (ArgumentError)
# user.subject('Maths', 'English', 'Social Study')

# Implementation of method overloading in ruby

# Default Arguments
class User
  def subject(sub1, sub2= "English", sub3="Science")
    puts "User had Subjects - #{sub1}, #{sub2}, and #{sub3 }"
  end
end

user = User.new
user.subject('Maths') # User had Subjects - Maths, English, and Science
user.subject('Maths', 'Social Study') # User had Subjects - Maths, Social Study, and Science

# Variable Length Arguments

class User
  def subject(*sub)
    # Argument Destructuring
    case sub.size
    when 1
      puts "User had only One Subject - #{sub[0]}"
    when 2
      puts "User had Two Subject - #{sub[0]} and #{sub[1]}"
    when 3
      puts "User had Three Subject - #{sub[0]}, #{sub[1]}, and #{sub[2]}"
    else
      puts "User had subjects - #{sub}" 
    end
  end
end

user = User.new
user.subject('Maths') # User had only One Subject - Maths
user.subject('Maths', 'Social Study') # User had Two Subject - Maths and Social Study
user.subject('Maths', 'Social Study', 'Science') # User had Three Subject - Maths, Social Study, and Science
user.subject('Maths', 'Social Study', 'Science', 'English') # User had subjects - ["Maths", "Social Study", "Science", "English"]

# Keyword Argument

class User
  def subject(subject1: , subject2: nil, subject3: nil)
    puts "User had Three Subject - #{subject1}, #{subject2}, and #{subject3}"
  end
end

user = User.new
user.subject(subject1: 'Maths') # User had Three Subject - Maths, , and
user.subject(subject1: 'Maths', subject3: 'Social Study') # User had Three Subject - Maths, , and Social Study
