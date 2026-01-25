# The main class
class Ruby

  def method_missing(input, *args) # method_missing function in action
     "#{input} not defined on #{self}"
  end

  def Type
    "The Type is Ruby"
  end
end

var = Ruby.new

# Calling a method that exists
puts var.Type    

# Calling a method that does not exist
puts var.Name