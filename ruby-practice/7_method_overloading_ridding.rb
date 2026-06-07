# Method Overriding — Class and subclass with the same behaviours
class User
  def full_name
    puts "method for full name of User"
  end
end

class StudentUser < User
  def full_name
    # super # will call parent class method
    puts "method for full name of User who is Student"
  end
end

user = User.new
student = StudentUser.new
user.full_name # method for full name of User
student.full_name # method for full name of User who is Student

# Method Overloading
# Based on basics oops concept we can't overload method in ruby. check ../method_overloading.rb

#implementation for method overloading in ruby
# Default Arguments
# Variable Length Arguments
# Keyword Argument