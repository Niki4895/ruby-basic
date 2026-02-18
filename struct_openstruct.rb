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