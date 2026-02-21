# In Ruby, Integer class is the basis for the two concrete classes that hold whole numbers. These concrete classes are Bignum and Fixnum. Fixnum holds integer values that are shown in the native machine word, whereas Bignum holds the integer value outside the range of Fixnum.

# to_i : This method returns int. The synonym of this method is to_int.
p "123.231".to_i # 123
p 123.231.to_i # 123

# chr : This method is used to return a string that contains the ASCII character represented by the receiver's value. The return type of this method is string.
puts 65.chr # A
puts ?a.chr # a

# downto : This method is used for passing decreasing values from int down to and including integer in the iterator block. The return type of this method is an integer.
6.downto(1){|i| print i, "..."}
puts "stop"

# floor : This method returns the largest integer less than or equal to int. This method is equivalent to to_i method. The return type of this method is integer.
puts 1.floor # 1
puts (-1).floor # -1

# integer? : This method always returns true for integer value and false for non-integer. The return type of this method is boolean.
puts 2.integer? # true
puts 0.1.integer? # false

# next : This method returns the integer that is equal to int+1. The return type of this method is an integer. The synonym of this method is succ.
puts 5.next # 6
puts -20.next # -19
puts -20.succ # -19
puts 4.succ # 5

# times : In this method, iterates block int times, passing in values from zero to int-1. The return type of this method is integer. 
6.times do|i|  
  print i, " "
end
puts "Stop"

# upto : In this method, iterates block, passing in integer values from int up to and including receiver's value. The return type of this method is integer.
20.upto(25){|a| print a, "... "}
puts "stop"

# round : This method is used to round off the int value. It returns floating-point number when the given value is positive, self for zero and when the given value is negative, then it is rounded down.
puts 2.round # 2
puts (29.67).round #30