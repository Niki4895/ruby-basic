# Ruby program to illustrate 
# Arithmetic operation

a = 2.1
b = 2

# Addition
c = a + b

puts "addition #{c}"

# Subtraction
d = a - b

puts "subtraction #{d}"

# Multiplication
e = a * b

puts "multiplication #{e}"

# Division
f = a / b

puts "division #{f}"

# Modulo
g = a % b

puts "modulo  #{g}"

# Exponent(Power)
h = 2 ** 2  

puts "exponent #{h}"

# Unary minus
i = -a

puts "unary minus #{i}"

# float <=> numeric --> 1, 0, +1 
p 1 <=> 1 # 0
p 1.0 <=> 1.0 # 0
p 1 <=> 1.0 # 0
puts 2.1 <=> 4 # -1
puts 2.0 <=> 2 # 0 
puts 4.6 <=> 2 # 1

# == : This method returns true if the obj is equal to float otherwise it returns false
puts 3.8 == 4 # false
puts 3.8 == 3.8 # true
puts 3.8 == 4.0 # false

# abs : This method return absolute value of float
puts (-54.56).abs # 54.56
puts (-65.04).abs # 65.04
puts (65.04).abs # 65.04

# ceil : This method returns the smallest Integer greater than or equal to float. The return type of this method is int.
puts (4.1).ceil # 5
puts (4.0).ceil # 4
puts (-4.1).ceil # -4

# divmod : This method will return an array that contains the quotient and modulus obtained by dividing num by numeric.
p (45.0.divmod 5) # [9, 0.0]
p (98.0.divmod 5) # [19, 3.0]

# eql? : This method check if the obj is Float and contains the same value as in float. If they contains same value then it will return true, otherwise return false. The return type of this method is boolean.
puts 4.2.eql?(2) # false
puts 1.2.eql?(1.2) # true
puts 8.eql?(8.0) # false
puts 8.eql?(8) # true

# finite? : This method check if the float is a valid IEEE floating-point number. If float is valid IEEE floating-point number then it will return true otherwise it will return false.
puts (45.0).finite? # true
puts (45.0/0.0).finite? # false

# floor : This method returns largest integer less than or equal to float.
puts 2.2. floor # 2
puts (-4.6).floor # -5
puts (-4.1).floor # -5

# infinite? : This method returns nil, -1, or +1 it depends upon float. If float is finite, then it return nil, if float is -infinite, then it return -1, or if float is +infinite then it return +1.
puts (1.1).infinite? # nil
puts (-1.1/0.0).infinite? # -1
puts (+1.1/0.0).infinite? # 1

# modulo: This method is similar to Float#% method
puts 32.45.modulo(20)

# nan? : This method return true if float is an invalid IEEE floating-point number otherwise it return false. The return type of this method is boolean.
puts (-2.2).nan? # false
puts (0.0/0.0).nan? # true

# round: This method rounds off float to the nearest integer value. The return type of this method is int.
puts 6.7.round # 7
puts (-8.9).round # -9
puts (-8.5).round # -9
puts (-8.4).round # -8
puts (100.0/3).round(2) # 33.33
puts (100/3).round(2) # 33

# to_f : This method return float.
puts "1002.32".to_f # 1002.32

# to_i : This method return float truncate to the integer. The return type of this method is int.
# to_int : This method is similar to Float#to_i
puts "1002.32".to_i # 1002
puts 1002.32.to_int # 1002

# to_s: This method returns a string that contains a representation of self, as well as a fixed or exponential form of numbering. The call may return NaN, infinity and -infinity.
puts 102.32.to_s
puts (102.32/0.0).to_s
puts (-102.32/0.0).to_s
puts (0.0/0).to_s

# truncate : This method is equal to Float#to_i method. The return type of this method is int.
puts 102.32.truncate # 102

# zero? : This method return true if float is 0.0 otherwise return false. The return type of this method is boolean.
puts 0.0.zero? # true
puts 0.zero? # true

puts Float::INFINITY      # Infinity
puts Float::NAN           # NaN
puts Float::EPSILON       # 2.220446049250313e-16
puts Float::DIG           # 15
puts 1.0 / 0.0 == Float::INFINITY
puts Float::MANT_DIG
puts Float::MAX
puts Float::MAX_10_EXP
puts Float::MAX_EXP
puts Float::MIN
puts Float::MIN_10_EXP
puts Float::MIN_EXP
puts Float::RADIX

# In expressions or methods
precision = Float::DIG
value = 1.23456789.round(precision)  # Uses 15 digits
p value

# With BigDecimal (common real-world use)
require 'bigdecimal'
require 'bigdecimal/util'
num = 1.234.to_d  # Defaults to Float::DIG precision
puts num  # => 0.1234E1
