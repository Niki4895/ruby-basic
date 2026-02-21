# Choose Struct for speed and structure in your Ruby web dev work; OpenStruct for prototyping or variable APIs.
# In Ruby, Struct creates lightweight classes with fixed, predefined attributes for efficient data grouping, while OpenStruct (from the ostruct library) allows dynamic addition of arbitrary attributes at runtime
=begin
| Aspect      | Struct                                | OpenStruct                       |
| ----------- | ------------------------------------- | -------------------------------- |
| Attributes  | Fixed at creation educative​          | Dynamic, add anytime educative​  |
| Performance | Faster, lightweight how​              | Slower (hash-based) how​         |
| Library     | Core Ruby how​                        | require 'ostruct' educative​     |
| Mutability  | Configurable, often frozen educative​ | Fully mutable vnegrisolo.github​ |
=end

Person = Struct.new(:name, :age)
person = Person.new("Alice", 30)
puts person.name  # Alice
puts person.age   # 30
person.name = "Bob"
puts person.name
p person

class MyClass < Struct.new(:a,:b,:c)
end

m = MyClass.new
m.a = 1
p m

#  Class Method
# new : This method creates a new class named by string, consisting accessor methods for the given symbols. If the name string is omitted, then the anonymous structure class will be created.
Struct.new("Geek", :tutorial_name, :topic_name)
Struct::Geek.new("ruby", "Struct")
Geek = Struct.new(:tutorial_name, :topic_name)
p Geek.new("Ruby", "Struct")

# Creating objects
str = Geek.new("Ruby", "Struct")
p str.tutorial_name
p str.topic_name

# Instance Method
# == : It is known as Equality. It returns true if str is equal to other_struct in terms of the values of instance variables. And also they must be of same class as created by Struct.new. Otherwise, it return false.

# Creating objects
str = Geek.new("Ruby", "Struct")
other_struct = Geek.new("Java", "array")
str1 = Geek.new("Ruby", "Struct")

# Check equality
p str == other_struct # false
p str == str1 # true

# [] : It is known as Attribute Reference. It returns the value of the instance variable named by symbol or index(0..length-1) by int. If the named variable does not exist, then it raises NameError and if the index is out of range then it raises IndexError.

# Creating objects
str = Geek.new("Ruby", "Struct")

# Using []
p str[:tutorial_name]
p str["topic_name"]
p str.tutorial_name

# []= : It is known as Attribute Assignment. It is used to assign the instance variable name with a symbol or the value of obj by int and return it. If the name of the instance variable does not exist or if the index is out of range, then it raise NameError.

# Creating objects
str = Geek.new("Ruby", "Struct")

# Using []=
str[:tutorial_name]= "Java"
str[:topic_name]= "array"
p str.tutorial_name
p str.topic_name

# each : This method call block for each instance variable and pass the value as a parameter

# Creating objects
str = Geek.new("Ruby", "Struct")
# Using each method
str.each{|a| puts (a)}

# each_pair : This method calls block for each instance variable and pass the name and value as parameter
str.each_pair{|tutorial_name, a| puts ("#{tutorial_name} => #{a}")}

# length : This method returns the number of instance variables. The return type of this method is an integer
# size : This method is similar to Struct#length method. The return type of this method is an intege
p str.length
p str.size

# members : This method returns an array of string that represent the name of the instance variable.
p str.members

# to_a : This method returns the values for this instance as an array.
p str.to_a[0]
p str.to_a[1]

# values : This method is similar to Struct#to_a method.

# Create structure
Geek = Struct.new(:p, :q, :r, :s)

# Creating objects
str = Geek.new(12, 13, 14, 15)

# Using values_at method
p str.values_at(2, 1)
p str.values_at(2, 1, 0, 3)

p "------------------------------------------------------------"
require 'ostruct'
person = OpenStruct.new
person.name = "Bob"
person.age = 25
person.city = "Delhi"  # Dynamic addition
puts person.name  # Bob
puts person.age   # 25
puts person.city  # Delhi
p person

h = { a: 1, b: 2 }
o = OpenStruct.new(h)
o.a = 10
o.b = 20
p o