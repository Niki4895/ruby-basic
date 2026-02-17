# Ruby program to illustrate 
# use of new method

# creating the customized class
# inherited from StandardError
class MyException < StandardError
  attr_reader :myobject

  def initialize(myobject)
    @myobject = myobject
  end
end

begin
# Using new method
# to create an object of
# the given exception
  raise MyException.new("My object"), "This is custom class"
rescue MyException => e
  puts e.message 
  puts e.myobject
end

# Ruby program to illustrate 
# use of backtrace method

# defining method
def a1
  # raise exception
  raise "OOPs! exception raise"
end

# defining method
def a2
  # calling method a1
  a1()
end

begin
  # calling method a2
  a2()
  # rescue exception
rescue => a_Details
  # print the backtrace details
  # related with exception
  puts a_Details.backtrace.join("\n")
  puts a_Details.message
  puts a_Details.set_backtrace(["1", "2"])
  puts a_Details.to_s
  puts a_Details.inspect
end
