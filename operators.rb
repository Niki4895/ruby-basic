# Modulus
puts ("Modulus:")
puts (20 % 7)

# Exponent
puts ("Exponent:")
puts (2 ** 4)


# Comparision Operators
puts "Equal To Operator:"
puts (10 == 20)
 
puts "Not Equal To Operator:"
puts (40 != 20)
 
puts "Greater than Operator"
puts (100 > 20)
 
puts "Less than Operator"
puts (10  < 20)
 
puts "Less than Equal To Operator"
puts (2  <=  5)

puts "Greater than Equal To Operator"
puts (2  >=  5)
 
puts "Combined combination operator"
puts(20 <=> 20)
puts(10 <=> 20)
puts(20 <=> 10)

# Logical operator 
# Variables
a = 10
b = 20
c = 30

p a == 10 && b == 20 && c == 30 # logical and
p  a == 10 || b == 20 # logical or
puts !(true) # logical not

a = 2
p a **= 3


# Bitwise Operators

# variables
a = 10
b = 20

puts "Bitwise AND operator"
puts (a & b)

puts "Bitwise OR operator"
puts (a |b)

puts "Bitwise XOR operator"
puts (a ^ b)

puts "Bitwise Complement operator"
puts (~a)

puts "Binary right shift operator"
puts (a >> 2)

puts "Binary left shift operator"
puts (a << 2)


puts defined? a
p defined? k
puts defined? 50   


=begin
Dot (.) operator is used to access the methods of a class.
Double Colon (::) operator is used to access the constants, class methods, and instance methods defined within a class or module to anywhere outside the class or module. The important point to remember is that classes and methods may be considered constants in Ruby and also prefix the :: Const_name with the expression which returns the appropriate class object. If no prefix expression is used then by default the main Object class is used.
=end


# operator overloading
class Car
    attr_accessor:name, :color
 
    # Initialize the name and color
    def initialize(name, color)
        @name = name
        @color = color
    end
    def +(obj)
        p self # a
        p obj # b
        return Car.new("#{self.name}#{obj.name}", 
                  "#{self.color}#{obj.color}")
    end
end
a = Car.new("Mercedes", "Red")
b = Car.new("Audi", "Silver")
puts (a+b).inspect

p $FILENAME