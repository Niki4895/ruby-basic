# An Array is an ordered, integer-indexed collection of objects, called elements. Any object may be an Array element.
# Array indexing starts at 0, as in C or Java.

=begin
A positive index is an offset from the first element:
Index 0 indicates the first element.
Index 1 indicates the second element.…

A negative index is an offset, backwards, from the end of the array:
Index -1 indicates the last element.
Index -2 indicates the next-to-last element.

You can create an Array object explicitly with:
An array literal. https://ruby-doc.org/core-3.1.0/doc/syntax/literals_rdoc.html#label-Array+Literals

You can convert certain objects to Arrays with:
Method Array.https://ruby-doc.org/core-3.1.0/Kernel.html#method-i-Array
=end

ary = [1, "two", 3.0]
p ary #=> [1, "two", 3.0]

p ary = Array.new    #=> []
p Array.new(3)       #=> [nil, nil, nil]
p Array.new(3, true) #=> [true, true, true]
p Array.new(4) {Hash.new}    #=> [{}, {}, {}, {}]
p Array.new(4) {|i| i.to_s } #=> ["0", "1", "2", "3"]

p empty_table = Array.new(3) {Array.new(3)} #=> [[nil, nil, nil], [nil, nil, nil], [nil, nil, nil]]
p Array({:a => "a", :b => "b"}) #=> [[:a, "a"], [:b, "b"]]

p "===============Accessing Elements=================="
# BY index
arr = [1, 2, 3, 4, 5, 6]
p arr[2]    #=> 3
p arr.at(2) #=> 3
p arr[100]  #=> nil
p arr[-3]   #=> 4
p arr[2, 3] #=> [3, 4, 5]
p arr[1..4] #=> [2, 3, 4, 5]
p arr[1..-3] #=> [2, 3, 4]

p arr.first #=> 1
p arr.last  #=> 6

p arr.take(3) #=> [1, 2, 3]
p "ARRAY => #{arr}" # "ARRAY => [1, 2, 3, 4, 5, 6]"
arr << 7
arr << 8
p arr.drop(3) #=> [4, 5, 6, 7, 8]
p "ARRAY => #{arr}" # "ARRAY => [1, 2, 3, 4, 5, 6, 7, 8 ]"

arr = ['a', 'b', 'c', 'd', 'e', 'f']
begin
    arr.fetch(100) #=> IndexError: index 100 outside of array bounds: -6...6
rescue => e
    p e
end
p arr.fetch(100, "oops") #=> "oops"

p "========================Obtaining Information about an Array============="
browsers = ['Chrome', 'Firefox', 'Safari', 'Opera', 'IE']
p browsers.length #=> 5
p browsers.count #=> 5

p browsers.empty? #=> false
p browsers.include?('Konqueror') #=> false

p "Adding Items to Arrays"
arr = [1, 2, 3, 4]
p arr.push(5) #=> [1, 2, 3, 4, 5] At end
p arr << 6    #=> [1, 2, 3, 4, 5, 6] At end
p arr.unshift(0) #=> [0, 1, 2, 3, 4, 5, 6] At beginning
# At some position
p arr.insert(3, 'apple')  #=> [0, 1, 2, 'apple', 3, 4, 5, 6]

p "Removing Items from an Array"
arr =  [1, 2, 3, 4, 5, 6]
p arr.pop #=> 6 From end
p arr #=> [1, 2, 3, 4, 5]

p arr.shift #=> 1 from beginning
p arr #=> [2, 3, 4, 5]

# from specific position
p arr.delete_at(2) #=> 4
p arr #=> [2, 3, 5]

# Specific elements by value
arr = [1, 2, 2, 3]
p arr.delete(2) #=> 2
p arr #=> [1,3]

# Remove blank/nil element from array
arr = ['foo', 0, nil, 'bar', 7, 'baz', nil]
p arr.compact  #=> ['foo', 0, 'bar', 7, 'baz']
p arr          #=> ['foo', 0, nil, 'bar', 7, 'baz', nil]
p arr.compact! #=> ['foo', 0, 'bar', 7, 'baz'] - In place update
p arr          #=> ['foo', 0, 'bar', 7, 'baz']

# Remove duplicate element from array
arr = [2, 5, 6, 556, 6, 6, 8, 9, 0, 123, 556]
p arr.uniq #=> [2, 5, 6, 556, 8, 9, 0, 123]

p "Iterating over Arrays"
arr = [1, 2, 3, 4, 5]
arr.each {|a| print a -= 10, " "}
# prints: -9 -8 -7 -6 -5
#=> [1, 2, 3, 4, 5]

words = %w[first second third fourth fifth sixth]
str = ""
words.reverse_each {|word| str += "#{word} "}
p str #=> "sixth fifth fourth third second first "
str = ''
words.find_all {|word| str += "#{word} "}
p str
str = ''
words.each {|word| str += "#{word} "}
p str

p "Selecting Items from an Array"
# Non-destructive Selection
arr = [1, 2, 3, 4, 5, 6]
p arr.select {|a| a > 3}       #=> [4, 5, 6]
p arr.reject {|a| a < 3}       #=> [3, 4, 5, 6]
p arr.drop_while {|a| a < 4}   #=> [4, 5, 6]
p arr                          #=> [1, 2, 3, 4, 5, 6]

# Destructive Selection
p arr.delete_if {|a| a < 4}   #=> [4, 5, 6]
p arr                         #=> [4, 5, 6]

arr = [1, 2, 3, 4, 5, 6]
p arr.keep_if {|a| a < 4}   #=> [1, 2, 3]
p arr                       #=> [1, 2, 3]


p "====================, class Array provides methods====================="
# Methods for Creating an Array
# [](*args)
p Array.[]( 1, 'a', /^A/)  # => [1, "a", /^A/]
p Array[ 1, 'a', /^A/ ]    # => [1, "a", /^A/]
p [ 1, 'a', /^A/ ]         # => [1, "a", /^A/]

# new → new_empty_array
# new(array) → new_array
# new(size) → new_array
# new(size, default_value) → new_array
# new(size) {|index| ... } → new_array
a = Array.new([:foo, 'bar', 2])
p a.class # => Array
p a # => [:foo, "bar", 2]

a = Array.new(3)
p a # => [nil, nil, nil]

a = Array.new(3, 'x')
p a # => ['x', 'x', 'x']

a = Array.new(3) {|index| "Element #{index}" }
p a # => ["Element 0", "Element 1", "Element 2"]

# try_convert(object) → object, new_array, or nil
p Array.try_convert(42) # nil
p Array.try_convert([1, 2]) # [1, 2]
p String.try_convert("hello") # hello

# to_ary enables implicit array-like behavior (e.g., splats *obj, parallel assignment x, y = obj, flatten), requiring a return value where kind_of?(Array) is true. to_a supports explicit conversions (e.g., Array(obj)), which is more flexible and often calls to_ary first if available.
class Point
  attr_reader :x, :y
  def initialize(x, y); @x, @y = x, y; end
  def to_ary; [x, y]; end  # Implicit: splat/assign
  def to_a;   [x, y]; end  # Explicit: Array()
end

point = Point.new(1, 2)
x, y = point             # => 1, 2 (to_ary)
p x, y
p *point                   # => [1, 2] (to_a called internally)
p Array.try_convert(point) # => [1, 2] (to_ary only)

# Public Instance Methods
# array * n → new_array
# array * string_separator → new_string
# When non-negative argument Integer n is given, returns a new
a = ['x', 'y']
p a * 3 # => ["x", "y", "x", "y", "x", "y"]

p [0, [0, 1], {foo: 0}] * ', ' # => "0, 0, 1, {:foo=>0}"

# array + other_array → new_array
a = [0, 1] + [2, 3]
p a # => [0, 1, 2, 3]

# array - other_array → new_array
p [0, 1, 1, 2, 1, 1, 3, 1, 1] - [1] # => [0, 2, 3]
p [0, 1, 2, 3] - [3, 0] # => [1, 2]
p [0, 1, 2] - [4] # => [0, 1, 2]

# array << object → self
a = [:foo, 'bar', 2]
p a << :baz # => [:foo, "bar", 2, :baz]

a = [:foo, 'bar', 2]
a1 = a << [3, 4]
p a1 # => [:foo, "bar", 2, [3, 4]]

# array <=> other_array → -1, 0, or 1
p [0, 1, 2] <=> [0, 1, 3] # => -1
p [0, 1, 2] <=> [0, 1, 1] # => 1
# Returns -1 if array is smaller than other_array:
p [0, 1, 2] <=> [0, 1, 2, 3] # => -1
# Returns 1 if array is larger than other_array:
p [0, 1, 2] <=> [0, 1] # => 1
# Returns 0 if array and other_array are the same size:
p [0, 1, 2] <=> [0, 1, 2] # => 0

# array == other_array → true or false
a0 = [:foo, 'bar', 2]
a1 = [:foo, 'bar', 2.0]
p a1 == a0 # => true
p [] == [] # => true

=begin
array[index] → object or nil
array[start, length] → object or nil
array[range] → object or nil
array[aseq] → object or nil
slice(index) → object or nil
slice(start, length) → object or nil
slice(range) → object or nil
slice(aseq) → object or nil
=end

a = [:foo, 'bar', 2]
p a[0] # => :foo
p a[2] # => 2
p a # => [:foo, "bar", 2]

# For reverse checking use negative value
a = [:foo, 'bar', 2]
p a[-1] # => 2
p a[-2] # => "bar"

a = [:foo, 'bar', 2]
p a[0, 2] # => [:foo, "bar"]
p a[1, 2] # => ["bar", 2]

a = [:foo, 'bar', 2]
p a[0, 4] # => [:foo, "bar", 2]
p a[1, 3] # => ["bar", 2]
p a[2, 2] # => [2]

# Range
a = [:foo, 'bar', 2]
p a[0..2] # => [:foo, "bar", 2]
p a[1..2] # => ["bar", 2]

a = [:foo, 'bar', 2]
p a[0..-1] # => [:foo, "bar", 2]
p a[0..-2] # => [:foo, "bar"]
p a[0..-3] # => [:foo]

# If range.start is negative, calculates the start index from the end:
a = [:foo, 'bar', 2]
p a[-1..2] # => [2]
p a[-2..2] # => ["bar", 2]
p a[-3..2] # => [:foo, "bar", 2]

a = [:foo, 'bar', 2]
p a[4..1] # => nil
p a[4..0] # => nil
p a[4..-1] # => nil

a = ['--', 'data1', '--', 'data2', '--', 'data3']
p a[(1..).step(2)] # => ["data1", "data2", "data3"]
p a[(1..).step(4)] # => ["data1", "data3"]

a = ['--', 'data1', '--', 'data2', '--', 'data3']
# p a[(1..11).step(2)]
# RangeError (((1..11).step(2)) out of range)
# p a[(7..).step(2)]
# RangeError (((7..).step(2)) out of range)

a = [:foo, 'bar', 2]
# Raises TypeError (no implicit conversion of Symbol into Integer):
# a[:foo]

# array[index] = object → object
# array[start, length] = object → object
# array[range] = object → object
a = [:foo, 'bar', 2]
p a[0] = 'foo' # => "foo"
p a # => ["foo", "bar", 2]

# If index is greater than self.length, extends the array:
a = [:foo, 'bar', 2]
p a[7] = 'foo' # => "foo"
p a # => [:foo, "bar", 2, nil, nil, nil, nil, "foo"]

a = [:foo, 'bar', 2]
p a[-1] = 'two' # => "two"
p a # => [:foo, "bar", "two"]

# When Integer arguments start and length are given and object is not an Array, removes length - 1 elements beginning at offset start, and assigns object at offset start:
# an offset is an integer representing the distance (displacement) from a fixed starting point (base address) to a specific element or data point. It is used to calculate memory addresses, navigate arrays, and manipulate data streams by defining how many units (bytes, elements) to move forward from the beginning.
a = [:foo, 'bar', 2, 3]
p a[0, 2] = 'foo' # => "foo"
p a # => ["foo", 2]

a = [:foo, 'bar', 2]
p a[-2, 2] = 'foo' # => "foo"
# p a # => [:foo, "foo"]

# If start is non-negative and outside the array ( >= self.size), extends the array with nil, assigns object at offset start, and ignores length:
a = [:foo, 'bar', 2]
p a[6, 50] = 'foo' # => "foo"
p a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

# If length is zero, shifts elements at and following offset start and assigns object at offset start:
a = [:foo, 'bar', 2]
p a[1, 0] = 'foo' # => "foo"
p a # => [:foo, "foo", "bar", 2]

# If length is too large for the existing array, does not extend the array:
a = [:foo, 'bar', 2]
p a[1, 5] = 'foo' # => "foo"
p a # => [:foo, "foo"]

# When Range argument range is given and object is an Array, removes length - 1 elements beginning at offset start, and assigns object at offset start:
a = [:foo, 'bar', 2]
p a[0..1] = 'foo' # => "foo"
p a # => ["foo", 2]

# if range.begin is negative, counts backwards from the end of the array:
a = [:foo, 'bar', 2]
p a[-2..2] = 'foo' # => "foo"
p a # => [:foo, "foo"]

# If the array length is less than range.begin, assigns object at offset range.begin, and ignores length:
a = [:foo, 'bar', 2]
p a[6..50] = 'foo' # => "foo"
p a # => [:foo, "bar", 2, nil, nil, nil, "foo"]

# If range.end is zero, shifts elements at and following offset start and assigns object at offset start:
a = [:foo, 'bar', 2]
p a[1..0] = 'foo' # => "foo"
p a # => [:foo, "foo", "bar", 2]

a = [:foo, 'bar', 2]
p a[1..-1] = 'foo' # => "foo"
p a # => [:foo, "foo"]
a = [:foo, 'bar', 2]
p a[1..-2] = 'foo' # => "foo"
p a # => [:foo, "foo", 2]
a = [:foo, 'bar', 2]
a[1..-3] = 'foo' # => "foo"
p a # => [:foo, "foo", "bar", 2]
a = [:foo, 'bar', 2]

# If range.end is too large for the existing array, replaces array elements, but does not extend the array with nil values:
a = [:foo, 'bar', 2]
p a[1..5] = 'foo' # => "foo"
p a # => [:foo, "foo"]


# all? → true or false
# all? {|element| ... } → true or false
# all?(obj) → true or false
p [0, 1, :foo].all? # => true
p [0, nil, 2].all? # => false
p [].all? # => true
p [0, 1, 2].all? { |element| element < 3 } # => true
p [0, 1, 2].all? { |element| element < 2 } # => false
p ['food', 'fool', 'foot'].all?(/foo/) # => true
p ['food', 'drink'].all?(/bar/) # => false
p [].all?(/foo/) # => true
p [0, 0, 0].all?(0) # => true
p [0, 1, 2].all?(1) # => false

# any? → true or false
# any? {|element| ... } → true or false
# any?(obj) → true or false
p [nil, 0, false].any? # => true
p [nil, false].any? # => false
p [].any? # => false
p [0, 1, 2].any? {|element| element > 1 } # => true
p [0, 1, 2].any? {|element| element > 2 } # => false
p ['food', 'drink'].any?(/foo/) # => true
p ['food', 'drink'].any?(/bar/) # => false
p [].any?(/foo/) # => false
p [0, 1, 2].any?(1) # => true
p [0, 1, 2].any?(3) # => false

# append(*args) Alias for: push

# assoc(obj) → found_array or nil
# Returns the first element in self that is an Array whose first element == obj:
a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
p a.assoc(4) # => [4, 5, 6]

# at(index) → object
a = [:foo, 'bar', 2]
p a.at(0) # => :foo
p a.at(2) # => 2

# bsearch {|element| ... } → object
# bsearch → new_enumerator
# bsearch_index {|element| ... } → integer or nil
# bsearch_index → new_enumerator
a = [1, 2, 3, 4]
puts a.bsearch { |x| x >= 3 }  # => 3

b = [111.11, 2.5, 4.3, 2.224].sort  # Note: must sort first for correct results
puts b.bsearch { |x| x >= 3 }       # => 4.3
a = [0, 4, 7, 10, 12]
puts a.bsearch { |x| x - 4 }  # =>

sorted = [1, 3, 5, 7]
puts sorted.bsearch_index { |x| x >= 4 }  # => 2 (index of 5)
puts (1..10).bsearch { |x| x >= 5 }  # => 5

# clear → self
a = [:foo, 'bar', 2]
a.clear # => []
p a #=> []

# map {|element| ... } → new_array
# map → new_enumerator
a = [:foo, 'bar', 2]
a1 = a.map {|element| element.class }
p a1 # => [Symbol, String, Integer]

a = [:foo, 'bar', 2]
a1 = a.map
p a1 # => #<Enumerator: [:foo, "bar", 2]:map>

# map! {|element| ... } → self
# map! → new_enumerator
a = [:foo, 'bar', 2]
a.map! { |element| element.class } # => [Symbol, String, Integer]
p a

a = [:foo, 'bar', 2]
a1 = a.map!
p a1 # => #<Enumerator: [:foo, "bar", 2]:map!>