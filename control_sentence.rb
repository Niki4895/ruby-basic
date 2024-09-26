# next
# next statement is used to jump to the next iterator of given loop.

for t in 0...10
  if t == 5 then 
    next
  end
  puts t 
end
p "=================="

# break
# Break statement is used to exit a loop when the condition is true
i = 1
while true   
  if i * 6 >= 30
    break
  end   
  puts i * 6   
  i += 1
end  
p "=================="

# redo
# The redo statement is used to restart the current iteration of a loop or the iterator
val = 0
while(val < 4)  
  puts val 
  val += 1
  redo if val == 4
end
p "=================="

# retry
# retry statement is used to restart an iterator based on a certain condition or any method invocation from the starting
var = 7
begin
  var.times do |v|
    puts "Value of local variable is #{v}"
    if v == 6
      var -= 1
      raise "too big"
    end
  end
rescue
  retry
end
p "=================="

# return
# This is used to exit from a method, with or without a value. It always returns a value to its caller
def geeks 
  val1 = 61
  val2 = 55
  return val1, val2 
  puts "Hello Geeks"
end
   
# variable outside the method to  
# store the return value of the method 
value = geeks
puts value 

# throw/catch Statement
# throw and catch are used to define a control structure which can be considered as a multilevel break

def lessNumber(num) 
  # using throw statement 
  # here 'numberError' is its label 
  throw :numberError if num < 10
  puts "Number is Greater than 10! #{num}"
end
  
  
# catch block 
catch :numberError do
  p "Handle number error"
  # calling method
  lessNumber(11) 
  lessNumber(78)  
    
  # exits catch block here 
  lessNumber(7) 
  lessNumber(4) 
end

BEGIN {  
  # BEGIN block code  
  puts "BEGIN code block"
}  
  
END {  
  # END block code  
  puts "END code block"
} 
# MAIN block code  
puts "GeeksForGeeks"
