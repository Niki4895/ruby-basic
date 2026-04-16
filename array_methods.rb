# combination(n) {|element| ... } → self
# combination(n) → new_enumerator
a = [0, 1, 2]
a.combination(2) {|combination| p combination }
# [0, 1]
# [0, 2]
# [1, 2]
a = [0, 1, 2]
a.combination(3) {|combination| p combination } # [0,1,2]
a = [0, 1, 2]
a1 = a.combination(0) {|combination| p combination } # []
a = [0, 1, 2]
# When n is out of range (negative or larger than self.size), does not call the block:
a.combination(-1) {|combination| fail 'Cannot happen' }
a.combination(4) {|combination| fail 'Cannot happen' }
a = [0, 1, 2]
p a.combination(2) # => #<Enumerator: [0, 1, 2]:combination(2)>

# compact → new_array
a = [nil, 0, nil, 1, nil, 2, nil]
p a.compact # => [0, 1, 2]
p a # [nil, 0, nil, 1, nil, 2, nil]
# compact! → self or nil
p a.compact! # => [0, 1, 2]
p a # => [0, 1, 2]

# concat(*other_arrays) → self
a = [0, 1]
p a.concat([2, 3], [4, 5]) # => [0, 1, 2, 3, 4, 5]

# count → an_integer
# count(obj) → an_integer
# count {|element| ... } → an_integer
p [0, 1, 2].count # => 3
p [].count # => 0
p [0, 1, 2, 0.0].count(0) # => 2
p [0, 1, 2].count(3) # => 0
p [0, 1, 1, 2, 1].count(1) # => 3
p [0, 1, 2, 3].count {|element| element > 1} # => 2

# cycle {|element| ... } → nil
# cycle(count) {|element| ... } → nil
# cycle → new_enumerator
# cycle(count) → new_enumerator
output = []
p [0, 1].cycle(2) {|element| output.push(element) } # => nil
p output # => [0, 1, 0, 1]
p [0, 1].cycle(0) {|element| fail 'Cannot happen' } # => nil
p [0, 1].cycle(-1) {|element| fail 'Cannot happen' } # => nil
# Prints 0 and 1 forever.
# [0, 1].cycle {|element| puts element }
# [0, 1].cycle(nil) {|element| puts element }
p [0, 1].cycle(2) # => #<Enumerator: [0, 1]:cycle(2)>
p [0, 1].cycle # => # => #<Enumerator: [0, 1]:cycle>
p [0, 1].cycle.first(5) # => [0, 1, 0, 1, 0]

# deconstruct()
arr = [1, 2, 3]
p arr.deconstruct
a, b, c = arr.deconstruct
p a, b, c

# delete(obj) → deleted_object
# delete(obj) {|nosuch| ... } → deleted_object or block_return
s1 = 'bar'
s2 = 'bar'
a = [:foo, s1, 2, s2]
p a.delete('bar') # => "bar"
p a # => [:foo, 2]

a = [:foo, s1, 2, s2]
deleted_obj = a.delete('bar') {|obj| fail 'Cannot happen' }
p a # => [:foo, 2]
p deleted_obj

a = [:foo, 'bar', 2]
p a.delete(:nosuch) {|obj| "#{obj} not found" } # => "nosuch not found"

# delete_at(index) → deleted_object or nil
a = [:foo, 'bar', 2]
p a.delete_at(1) # => "bar"
p a # => [:foo, 2]

a = [:foo, 'bar', 2]
p a.delete_at(-2) # => "bar"
p a # => [:foo, 2]

# delete_if {|element| ... } → self
# delete_if → Enumerator
a = [:foo, 'bar', 2, 'bat']
p a.delete_if {|element| element.to_s.start_with?('b') } # => [:foo, 2]

a = [:foo, 'bar', 2]
p a.delete_if # => #<Enumerator: [:foo, "bar", 2]:delete_if>

# difference(*other_arrays) → new_array
# Returns a new Array containing only those elements from self that are not found in any of the Arrays other_arrays; items are compared using eql?; order from self is preserved:
p [0, 1, 1, 2, 1, 1, 3, 1, 1].difference([1]) # => [0, 2, 3]
p [0, 1, 2, 3].difference([3, 0], [1, 3]) # => [2]
p [0, 1, 2, 3].difference([3, 0, 1]) # => [2]
p [0, 1, 2].difference([4]) # => [0, 1, 2]

# dig(index, *identifiers) → object
# Finds and returns the object in nested objects that is specified by index and identifiers. The nested objects may be instances of various classes. See Dig Methods.
a = [:foo, [:bar, :baz, [:bat, :bam]]]
p a.dig(1) # => [:bar, :baz, [:bat, :bam]]
p a.dig(1, 2) # => [:bat, :bam]
p a.dig(1, 2, 0) # => :bat
p a.dig(1, 2, 3) # => nil

# drop(n) → new_array
# Returns a new Array containing all but the first n element of self, where n is a non-negative Integer; does not modify self.
a = [0, 1, 2, 3, 4, 5]
p a.drop(2) # => [2, 3, 4, 5]
p a.drop(0) # => [0, 1, 2, 3, 4, 5]
p a.drop(1) # => [1, 2, 3, 4, 5]
p a.drop(2) # => [2, 3, 4, 5]

# drop_while {|element| ... } → new_array
# drop_while → new_enumerator
a = [0, 1, 2, 3, 4, 5]
p a.drop_while {|element| element < 3 } # => [3, 4, 5]
p [0, 1].drop_while # => # => #<Enumerator: [0, 1]:drop_while>

# each {|element| ... } → self
# each → Enumerator
a = [:foo, 'bar', 2]
p a.each {|element|  puts "#{element.class} #{element}" }
# Symbol foo
# String bar
# Integer 2

a = [:foo, 'bar', 2]
p a.each {|element| puts element; a.clear if element.to_s.start_with?('b') }
# foo
# bar
# []

a = [:foo, 'bar', 2]
e = a.each
e # => #<Enumerator: [:foo, "bar", 2]:each>
a1 = e.each {|element|  puts "#{element.class} #{element}" }
# Symbol foo
# String bar
# Integer 2

# each_index {|index| ... } → self
# each_index → Enumerator
a = [:foo, 'bar', 2]
a.each_index {|index|  puts "#{index} #{a[index]}" }
# 0 foo
# 1 bar
# 2 2

a = [:foo, 'bar', 2]
a.each_index {|index| puts index; a.clear if index > 0 }
# 0 1

a = [:foo, 'bar', 2]
e = a.each_index
e # => #<Enumerator: [:foo, "bar", 2]:each_index>
a1 = e.each {|index|  puts "#{index} #{a[index]}"}
# 0 foo
# 1 bar
# 2 2

# empty? → true or false
p a.empty? # false
p [].empty? # true


# eql? other_array → true or false
a0 = [:foo, 'bar', 2]
a1 = [:foo, 'bar', 2]
p a1.eql?(a0) # => true

# fetch(index) → element
# fetch(index, default_value) → element
# fetch(index) {|index| ... } → elemen
a = [:foo, 'bar', 2]
p a.fetch(1) # => "bar"
a = [:foo, 'bar', 2]
p a.fetch(-1) # => 2
p a.fetch(-2) # => "bar"

a = [:foo, 'bar', 2]
p a.fetch(1, nil) # => "bar"
p a.fetch(3, "Not Found") # => "Not Found"

a = [:foo, 'bar', 2]
p a.fetch(1) {|index| raise 'Cannot happen' } # => "bar"
p a.fetch(50) {|index| "Value for #{index}" } # => "Value for 50"

# fill(obj) → self
# fill(obj, start) → self
# fill(obj, start, length) → self
# fill(obj, range) → self
# fill {|index| ... } → self
# fill(start) {|index| ... } → self
# fill(start, length) {|index| ... } → self
# fill(range) {|index| ... } → self

a = ['a', 'b', 'c', 'd']
p  a # => ["a", "b", "c", "d"]
p a.fill(:X) # => [:X, :X, :X, :X]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, 2) # => ["a", "b", :X, :X]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, 4) # => ["a", "b", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, 5) # => ["a", "b", "c", "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, -2) # => ["a", "b", :X, :X]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, -6) # => [:X, :X, :X, :X]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, -50) # => [:X, :X, :X, :X]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, 1, 1) # => ["a", :X, "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, -2, 1) # => ["a", "b", :X, "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, 5, 0) # => ["a", "b", "c", "d", nil]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, 5, 2) # => ["a", "b", "c", "d", nil, :X, :X]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, 1, 0) # => ["a", "b", "c", "d"]
p a.fill(:X, 1, -1) # => ["a", "b", "c", "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, (1..1)) # => ["a", :X, "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, (-1..1)) # => ["a", "b", "c", "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, (0..-2)) # => [:X, :X, :X, "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, (1..-2)) # => ["a", :X, :X, "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(:X, (-1..-1)) # => ["a", "b", "c", :X]
a = ['a', 'b', 'c', 'd']
p a.fill(:X, (-2..-2)) # => ["a", "b", :X, "d"]

a = ['a', 'b', 'c', 'd']
p a.fill { |index| "new_#{index}" } # => ["new_0", "new_1", "new_2", "new_3"]
a = ['a', 'b', 'c', 'd']
p a.fill(1) { |index| "new_#{index}" } # => ["a", "new_1", "new_2", "new_3"]

a = ['a', 'b', 'c', 'd']
p a.fill(4) { |index| fail 'Cannot happen' } # => ["a", "b", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(4) { |index| fail 'Cannot happen' } # => ["a", "b", "c", "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(-2) { |index| "new_#{index}" } # => ["a", "b", "new_2", "new_3"]

a = ['a', 'b', 'c', 'd']
p a.fill(-6) { |index| "new_#{index}" } # => ["new_0", "new_1", "new_2", "new_3"]
a = ['a', 'b', 'c', 'd']
p a.fill(-50) { |index| "new_#{index}" } # => ["new_0", "new_1", "new_2", "new_3"]

a = ['a', 'b', 'c', 'd']
p a.fill(1, 1) { |index| "new_#{index}" } # => ["a", "new_1", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(-2, 1) { |index| "new_#{index}" } # => ["a", "b", "new_2", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(5, 0) { |index| "new_#{index}" } # => ["a", "b", "c", "d", nil]
a = ['a', 'b', 'c', 'd']
p a.fill(5, 2) { |index| "new_#{index}" } # => ["a", "b", "c", "d", nil, "new_5", "new_6"]

a = ['a', 'b', 'c', 'd']
p a.fill(1, 0) { |index| "new_#{index}" } # => ["a", "b", "c", "d"]
p a.fill(1, -1) { |index| "new_#{index}" } # => ["a", "b", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(1..1) { |index| "new_#{index}" } # => ["a", "new_1", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(-1..1) { |index| fail 'Cannot happen' } # => ["a", "b", "c", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(0..-2) { |index| "new_#{index}" } # => ["new_0", "new_1", "new_2", "d"]
a = ['a', 'b', 'c', 'd']
p a.fill(1..-2) { |index| "new_#{index}" } # => ["a", "new_1", "new_2", "d"]

a = ['a', 'b', 'c', 'd']
p a.fill(-1..-1) { |index| "new_#{index}" } # => ["a", "b", "c", "new_3"]
a = ['a', 'b', 'c', 'd']
p a.fill(-2..-2) { |index| "new_#{index}" } # => ["a", "b", "new_2", "d"]

# select {|element| ... } → new_array
# select → new_enumerator
a = [:foo, 'bar', 2, :bam]
a1 = a.select {|element| element.to_s.start_with?('b') }
p a1 # => ["bar", :bam]
p a # => [:foo, 'bar', 2, :bam]
a = [:foo, 'bar', 2, :bam]
p a.select # => #<Enumerator: [:foo, "bar", 2, :bam]:select>

# select! {|element| ... } → self or nil
# select! → new_enumerator
a = [:foo, 'bar', 2, :bam]
a.select! {|element| element.to_s.start_with?('b') } # => ["bar", :bam]
p a # => ["bar", :bam]

a = [:foo, 'bar', 2, :bam]
p a.select! # => #<Enumerator: [:foo, "bar", 2, :bam]:select!>

# index(object) → integer or nil
# index {|element| ... } → integer or nil
# index → new_enumerator
a = [:foo, 'bar', 2, 'bar']
p a.index('bar') # => 1

a = [:foo, 'bar', 2, 'bar']
p a.index {|element| element == 'bar' } # => 1

a = [:foo, 'bar', 2]
e = a.index
p e # => #<Enumerator: [:foo, "bar", 2]:index>
p e.each {|element| element == 'bar' } # => 1

# first → object or nil
# first(n) → new_array
a = [:foo, 'bar', 2]
p a.first # => :foo
p a # => [:foo, "bar", 2]
a = [:foo, 'bar', 2]
p a.first(2) # => [:foo, "bar"]
a = [:foo, 'bar', 2]
p a.first(50) # => [:foo, "bar", 2]
a = [:foo, 'bar', 2]
p a.first(0) # []

# flatten → new_array
# flatten(level) → new_array
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(0) # => [0, [1, [2, 3], 4], 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(1) # => [0, 1, [2, 3], 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(2) # => [0, 1, 2, 3, 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(3) # => [0, 1, 2, 3, 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten # => [0, 1, 2, 3, 4, 5]
[0, 1, 2].flatten # => [0, 1, 2]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(-1) # => [0, 1, 2, 3, 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten(-2) # => [0, 1, 2, 3, 4, 5]
p [0, 1, 2].flatten(-1) # => [0, 1, 2]

# flatten! → self or nil
# flatten!(level) → self or nil
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten!(1) # => [0, 1, [2, 3], 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten!(2) # => [0, 1, 2, 3, 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten!(3) # => [0, 1, 2, 3, 4, 5]
p [0, 1, 2].flatten!(1) # => nil
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten! # => [0, 1, 2, 3, 4, 5]
p [0, 1, 2].flatten! # => nil
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten!(-1) # => [0, 1, 2, 3, 4, 5]
a = [ 0, [ 1, [2, 3], 4 ], 5 ]
p a.flatten!(-2) # => [0, 1, 2, 3, 4, 5]
p [0, 1, 2].flatten!(-1) # => nil

# hash → integer
# p [0, 1, 2].hash
p [0, 1, 2].hash == [0, 1, 2].hash # => true
p [0, 1, 2].hash == [0, 1, 3].hash # => false

# include?(obj) → true or false
p [0, 1, 2].include?(2) # => true
p [0, 1, 2].include?(3) # => false

# replace(other_array) → self
a = [:foo, 'bar', 2]
p a.replace(['foo', :bar, 3]) # => ["foo", :bar, 3]

# insert(index, *objects) → self
a = [:foo, 'bar', 2]
p a.insert(1, :bat, :bam) # => [:foo, :bat, :bam, "bar", 2]

a = [:foo, 'bar', 2]
p a.insert(5, :bat, :bam)
p a # => [:foo, "bar", 2, nil, nil, :bat, :bam]
a = [:foo, 'bar', 2]
# Does nothing if no objects given:
a.insert(1)
a.insert(50)
a.insert(-50)
a # => [:foo, "bar", 2]

a = [:foo, 'bar', 2]
a.insert(-2, :bat, :bam)
p a # => [:foo, "bar", :bat, :bam, 2]

# inspect → new_string
a = [:foo, 'bar', 2]
p a.inspect # => "[:foo, \"bar\", 2]"

# intersect?(other_ary) → true or false
a = [ 1, 2, 3 ]
b = [ 3, 4, 5 ]
c = [ 5, 6, 7 ]
if RUBY_VERSION.to_f > 3.2
    p a.intersect?(b)   #=> true
    p a.intersect?(c)   #=> false
end

# intersection(*other_arrays) → new_array
p [0, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) # => [0, 1]
p [0, 0, 1, 1, 2, 3].intersection([0, 1, 2], [0, 1, 3]) # => [0, 1]
p [0, 1, 2].intersection([2, 1, 0]) # => [0, 1, 2]

# join →new_string
# join(separator = $,) → new_string
a = [:foo, 'bar', 2]
p $, # => nil
p a.join # => "foobar2"
a = [:foo, 'bar', 2]
p a.join("\n") # => "foo\nbar\n2"
a = [:foo, [:bar, [:baz, :bat]]]
p a.join # => "foobarbazbat"

# keep_if {|element| ... } → self
# keep_if → new_enumeration
a = [:foo, 'bar', 2, :bam]
p a.keep_if {|element| element.to_s.start_with?('b') } # => ["bar", :bam]
a = [:foo, 'bar', 2, :bam]
p a.keep_if # => #<Enumerator: [:foo, "bar", 2, :bam]:keep_if>

# last → object or nil
# last(n) → new_array
a = [:foo, 'bar', 2]
p a.last # => 2
p a # => [:foo, "bar", 2]
a = [:foo, 'bar', 2]
p a.last(2) # => ["bar", 2]
a = [:foo, 'bar', 2]
p a.last(50) # => [:foo, "bar", 2]
a = [:foo, 'bar', 2]
p a.last(0) # []

# length → an_integer
a = [:foo, 'bar', 2]
p a.length # 3

# max → element
# max {|a, b| ... } → element
# max(n) → new_array
# max(n) {|a, b| ... } → new_array

p [0, 1, 2].max # => 2
p [0, 1, 2, 3].max(3) # => [3, 2, 1]
p [0, 1, 2, 3].max(6) # => [3, 2, 1, 0]

p ['0', '00', '000'].max {|a, b| a.size <=> b.size } # => "000"
p ['0', '00', '000'].max(2) {|a, b| a.size <=> b.size } # => ["000", "00"]

# min → element
# min { |a, b| ... } → element
# min(n) → new_array
# min(n) { |a, b| ... } → new_array
p [0, 1, 2].min # => 0
p [0, 1, 2, 3].min(3) # => [0, 1, 2]
p [0, 1, 2, 3].min(6) # => [0, 1, 2, 3]
p ['0', '00', '000'].min { |a, b| a.size <=> b.size } # => "0"
p ['0', '00', '000'].min(2) {|a, b| a.size <=> b.size } # => ["0", "00"]

# minmax → [min_val, max_val]
# minmax {|a, b| ... } → [min_val, max_val]
p [0, 1, 2].minmax # => [0, 2]
p ['0', '00', '000'].minmax {|a, b| a.size <=> b.size } # => ["0", "000"]

# none? → true or false
# none? {|element| ... } → true or false
# none?(obj) → true or false

p [nil, false].none? # => true
p [nil, 0, false].none? # => false
p [].none? # => true
p [0, 1, 2].none? {|element| element > 3 } # => true
p [0, 1, 2].none? {|element| element > 1 } # => false
p ['food', 'drink'].none?(/bar/) # => true
p ['food', 'drink'].none?(/foo/) # => false
p [].none?(/foo/) # => true
p [0, 1, 2].none?(3) # => true
p [0, 1, 2].none?(1) # => false

# old_to_s() # Alias for: to_s

# one? → true or false
# one? {|element| ... } → true or false
# one?(obj) → true or false
p [nil, 0].one? # => true
p [0, 0].one? # => false
p [nil, nil].one? # => false
p [].one? # => false

p [0, 1, 2].one? {|element| element > 0 } # => false
p [0, 1, 2].one? {|element| element > 1 } # => true
p [0, 1, 2].one? {|element| element > 2 } # => false

p [0, 1, 2].one?(0) # => true
p [0, 0, 1].one?(0) # => false
p [1, 1, 2].one?(0) # => false
p ['food', 'drink'].one?(/bar/) # => false
p ['food', 'drink'].one?(/foo/) # => true
p [].one?(/foo/) # => false

# pack( aTemplateString ) → aBinaryString
# pack( aTemplateString, buffer: aBufferString ) → aBufferString
a = [ "a", "b", "c" ]
n = [ 65, 66, 67 ]
p a.pack("A3A3A3")   #=> "a  b  c  "
p a.pack("a3a3a3")   #=> "a\000\000b\000\000c\000\000"
p n.pack("ccc")      #=> "ABC"

# packed data is appended by default
p [255].pack("C", buffer:"foo".b) #=> "foo\xFF"

# "@0" (offset 0) specifies that packed data is filled from beginning.
# Also, original data after packed data is removed. ("oo" is removed.)
p [255].pack("@0C", buffer:"foo".b) #=> "\xFF"

# If the offset is bigger than the original length, \x00 is filled.
p [255].pack("@5C", buffer:"foo".b) #=> "foo\x00\x00\xFF"

# permutation {|element| ... } → self
# permutation(n) {|element| ... } → self
# permutation → new_enumerator
# permutation(n) → new_enumerator
a = [0, 1, 2]
p a.permutation(2) {|permutation| p permutation }
=begin
[0, 1]
[0, 2]
[1, 0]
[1, 2]
[2, 0]
[2, 1]
=end

a = [0, 1, 2]
a.permutation(3) {|permutation| p permutation }
a.permutation {|permutation| p permutation }
# [0, 1, 2]
# [0, 2, 1]
# [1, 0, 2]
# [1, 2, 0]
# [2, 0, 1]
# [2, 1, 0]

a = [0, 1, 2]
a.permutation(0) {|permutation| p permutation } # []
a = [0, 1, 2]
p a.permutation(-1) {|permutation| fail 'Cannot happen' }
p a.permutation(4) {|permutation| fail 'Cannot happen' }

a = [0, 1, 2]
p a.permutation # => #<Enumerator: [0, 1, 2]:permutation>
p a.permutation(2) # => #<Enumerator: [0, 1, 2]:permutation(2)>

# pop → object or nil
# pop(n) → new_array
a = [:foo, 'bar', 2]
p a.pop # => 2
p a # => [:foo, "bar"]
a = [:foo, 'bar', 2]
p a.pop(2) # => ["bar", 2]
a = [:foo, 'bar', 2]
p a.pop(50) # => [:foo, "bar", 2]

# prepend(*args) # Alias for: unshift

# product(*other_arrays) → new_array
# product(*other_arrays) {|combination| ... } → self

a = [0, 1, 2]
a1 = [3, 4]
a2 = [5, 6]
p = a.product(a1)
puts p.size # => 6 # a.size * a1.size
p  p # => [[0, 3], [0, 4], [1, 3], [1, 4], [2, 3], [2, 4]]
p = a.product(a1, a2)
puts p.size # => 12 # a.size * a1.size * a2.size
p p # => [[0, 3, 5], [0, 3, 6], [0, 4, 5], [0, 4, 6], [1, 3, 5], [1, 3, 6], [1, 4, 5], [1, 4, 6], [2, 3, 5], [2, 3, 6], [2, 4, 5], [2, 4, 6]]
p a.product # => [[0], [1], [2]]
a.product(a1) {|combination| p combination }
# [0, 3]
# [0, 4]
# [1, 3]
# [1, 4]
# [2, 3]
# [2, 4]
a.product(a1, a2, []) {|combination| fail 'Cannot happen' }
a.product {|combination| p combination }
# [0]
# [1]
# [2]

# push(*objects) → self
a = [:foo, 'bar', 2]
p a.push(:baz, :bat) # => [:foo, "bar", 2, :baz, :bat]
a = [:foo, 'bar', 2]
a1 = a.push([:baz, :bat], [:bam, :bad])
p a1 # => [:foo, "bar", 2, [:baz, :bat], [:bam, :bad]]

# Array#append is an alias for Array#push.
# Related: pop, shift, unshift.
# Also aliased as: append

# rassoc(obj) → found_array or nil
a = [{foo: 0}, [2, 4], [4, 5, 6], [4, 5]]
p a.rassoc(4) # => [2, 4]

# reject {|element| ... } → new_array
# reject → new_enumerator
a = [:foo, 'bar', 2, 'bat']
a1 = a.reject {|element| element.to_s.start_with?('b') }
p a1 # => [:foo, 2]
p a # [:foo, 'bar', 2, 'bat']
a = [:foo, 'bar', 2]
p a.reject # => #<Enumerator: [:foo, "bar", 2]:reject>

# reject! {|element| ... } → self or nil
# reject! → new_enumerator
a = [:foo, 'bar', 2, 'bat']
a.reject! {|element| element.to_s.start_with?('b') } # => [:foo, 2]
p a # => [:foo, 2]
a = [:foo, 'bar', 2]
p a.reject! # => #<Enumerator: [:foo, "bar", 2]:reject!>

# repeated_combination(n) {|combination| ... } → self
# repeated_combination(n) → new_enumerator
a = [0, 1, 2]
a.repeated_combination(1) {|combination| p combination }
# [0]
# [1]
# [2]
a.repeated_combination(2) {|combination| p combination }
# [0, 0]
# [0, 1]
# [0, 2]
# [1, 1]
# [1, 2]
# [2, 2]
a.repeated_combination(-1) {|combination| fail 'Cannot happen' }
a = [0, 1, 2]
p a.repeated_combination(2) # => #<Enumerator: [0, 1, 2]:combination(2)>
e = a.repeated_combination(0)
p e.size # => 1
p e.to_a # => [[]]
e = a.repeated_combination(1)
p e.size # => 3
p e.to_a # => [[0], [1], [2]]
e = a.repeated_combination(2)
p e.size # => 6
p e.to_a # => [[0, 0], [0, 1], [0, 2], [1, 1], [1, 2], [2, 2]]

# repeated_permutation(n) {|permutation| ... } → self
# repeated_permutation(n) → new_enumerator
a = [0, 1, 2]
p a.repeated_permutation(1) {|permutation| p permutation }
# [0]
# [1]
# [2]
p a.repeated_permutation(2) {|permutation| p permutation }
# [0, 0]
# [0, 1]
# [0, 2]
# [1, 0]
# [1, 1]
# [1, 2]
# [2, 0]
# [2, 1]
# [2, 2]
p a.repeated_permutation(-1) {|permutation| fail 'Cannot happen' }
a = [0, 1, 2]
p a.repeated_permutation(2) # => #<Enumerator: [0, 1, 2]:permutation(2)>
e = a.repeated_permutation(0)
p e.size # => 1
p e.to_a # => [[]]
e = a.repeated_permutation(1)
p e.size # => 3
p e.to_a # => [[0], [1], [2]]
e = a.repeated_permutation(2)
p e.size # => 9
p e.to_a # => [[0, 0], [0, 1], [0, 2], [1, 0], [1, 1], [1, 2], [2, 0], [2, 1], [2, 2]]

# reverse → new_array
a = ['foo', 'bar', 'two']
a1 = a.reverse
p a1 # => ["two", "bar", "foo"]
p a # => ["two", "bar", "foo"]

# reverse! → self
a = ['foo', 'bar', 'two']
p a.reverse! # => ["two", "bar", "foo"]

# reverse_each {|element| ... } → self
# reverse_each → Enumerator
a = [:foo, 'bar', 2]
a.reverse_each {|element|  puts "#{element.class} #{element}" }
# Integer 2
# String bar
# Symbol foo

a = [:foo, 'bar', 2]
a.reverse_each {|element| puts element; a.clear if element.to_s.start_with?('b') }
# 2
# bar
a = [:foo, 'bar', 2]
e = a.reverse_each
e # => #<Enumerator: [:foo, "bar", 2]:reverse_each>
a1 = e.each {|element|  puts "#{element.class} #{element}" }
# Integer 2
# String bar
# Symbol foo

# rindex(object) → integer or nil
# rindex {|element| ... } → integer or nil
# rindex → new_enumerator

a = [:foo, 'bar', 2, 'bar']
p a.rindex('bar') # => 3

a = [:foo, 'bar', 2, 'bar']
p a.rindex {|element| element == 'bar' } # => 3

a = [:foo, 'bar', 2, 'bar']
e = a.rindex
e # => #<Enumerator: [:foo, "bar", 2, "bar"]:rindex>
p e.each {|element| element == 'bar' } # => 3

# rotate → new_array
# rotate(count) → new_array
a = [:foo, 'bar', 2, 'bar']
a1 = a.rotate
p a1 # => ["bar", 2, "bar", :foo]

a = [:foo, 'bar', 2]
p a.rotate # ["bar", 2, :foo]
a1 = a.rotate(2)
p a1 # => [2, :foo, "bar"]

# If count is large, uses count % array.size as the count:
a = [:foo, 'bar', 2]
a1 = a.rotate(20)
a1 # => [2, :foo, "bar"]

# If count is zero, returns a copy of self, unmodified:
a = [:foo, 'bar', 2]
a1 = a.rotate(0)
p a1 # => [:foo, "bar", 2]

a = [:foo, 'bar', 2]
a1 = a.rotate(-2)
p a1 # => ["bar", 2, :foo]

# If count is small (far from zero), uses count % array.size as the count:
a = [:foo, 'bar', 2]
a1 = a.rotate(-5)
p a1 # => ["bar", 2, :foo]

# rotate! → self
# rotate!(count) → self
a = [:foo, 'bar', 2, 'bar']
p a.rotate! # => ["bar", 2, "bar", :foo]

a = [:foo, 'bar', 2]
a.rotate!(2)
p a # => [2, :foo, "bar"]

# If count is large, uses count % array.size as the count:
a = [:foo, 'bar', 2]
a.rotate!(20)
p a # => [2, :foo, "bar"]

a = [:foo, 'bar', 2]
a.rotate!(0)
p a # => [:foo, "bar", 2]

a = [:foo, 'bar', 2]
a.rotate!(-2)
p a # => ["bar", 2, :foo]

a = [:foo, 'bar', 2]
a.rotate!(-5)
p a # => ["bar", 2, :foo]

# sample(random: Random) → object
# sample(n, random: Random) → new_ary
# Returns random elements from self.
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.sample # => 3
p a.sample # => 8

p a.sample(3) # => [8, 9, 2]
p a.sample(6) # => [9, 6, 10, 3, 1, 4]

p a.sample(a.size * 2) # => [6, 4, 1, 8, 5, 9, 10, 2, 3, 7]

a = [1, 1, 1, 2, 2, 3]
p a.sample(a.size * 2) # => [1, 1, 3, 2, 1, 2]

a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p a.sample(random: Random.new(1))     #=> 6
p a.sample(4, random: Random.new(1))  #=> [6, 10, 9, 2]

# select {|element| ... } → new_array
# select → new_enumerator
a = [:foo, 'bar', 2, :bam]
a1 = a.select {|element| element.to_s.start_with?('b') }
p a1 # => ["bar", :bam]

a = [:foo, 'bar', 2, :bam]
a.select # => #<Enumerator: [:foo, "bar", 2, :bam]:select>

# select! {|element| ... } → self or nil
# select! → new_enumerator
a = [:foo, 'bar', 2, :bam]
a.select! {|element| element.to_s.start_with?('b') } # => ["bar", :bam]
p a

a = [:foo, 'bar', 2, :bam]
p a.select! # => #<Enumerator: [:foo, "bar", 2, :bam]:select!>

# shift → object or nil
# shift(n) → new_array
a = [:foo, 'bar', 2]
p a.shift # => :foo
p a # => ['bar', 2]

a = [:foo, 'bar', 2]
p a.shift(2) # => [:foo, 'bar']
p a # => [2]

a = [:foo, 'bar', 2]
p a.shift(3) # => [:foo, 'bar', 2]

# shuffle(random: Random) → new_ary
a = [1, 2, 3] #=> [1, 2, 3]
p a.shuffle     #=> [2, 3, 1]
p a             #=> [1, 2, 3]
p a.shuffle(random: Random.new(1))  #=> [1, 3, 2]

# shuffle!(random: Random) → array
a = [1, 2, 3] #=> [1, 2, 3]
p a.shuffle!    #=> [2, 3, 1]
p a             #=> [2, 3, 1]
p a.shuffle!(random: Random.new(1))  #=> [1, 3, 2]

# slice(index) → object or nil
# slice(start, length) → object or nil
# slice(range) → object or nil
# slice(aseq) → object or nil
a = [:foo, 'bar', 2]
p a[0] # => :foo
p a[2] # => 2
p a # => [:foo, "bar", 2]

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

a = [:foo, 'bar', 2]
p a[0..1] # => [:foo, "bar"]
p a[1..2] # => ["bar", 2]

a = [:foo, 'bar', 2]
p a[0..-1] # => [:foo, "bar", 2]
p a[0..-2] # => [:foo, "bar"]
p a[0..-3] # => [:foo]

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

a = ['--', 'data1', '--', 'data2', '--', 'data3']
# p a[(1..11).step(2)]
# RangeError (((1..11).step(2)) out of range)
# p a[(7..).step(2)]
# RangeError (((7..).step(2)) out of range)
a = [:foo, 'bar', 2]
# Raises TypeError (no implicit conversion of Symbol into Integer):
# a[:foo]

# slice!(n) → object or nil
# slice!(start, length) → new_array or nil
# slice!(range) → new_array or nil
a = [:foo, 'bar', 2]
a.slice!(1) # => "bar"
p a # => [:foo, 2]

a = [:foo, 'bar', 2]
a.slice!(-1) # => 2
p a # => [:foo, "bar"]

a = [:foo, 'bar', 2]
a.slice!(0, 2) # => [:foo, "bar"]
p a # => [2]

a = [:foo, 'bar', 2]
a.slice!(1, 50) # => ["bar", 2]
p a # => [:foo]

a = [:foo, 'bar', 2]
a.slice!(1..2) # => ["bar", 2]
p a # => [:foo]

a = [:foo, 'bar', 2]
a.slice!(0..-2) # => [:foo, "bar"]
p a # => [2]

a = [:foo, 'bar', 2]
a.slice!(-2..2) # => ["bar", 2]
p a # => [:foo]

# sort → new_array
# sort {|a, b| ... } → new_array
a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a1 = a.sort
p a1 # => ["a", "b", "c", "d", "e"]

a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a1 = a.sort {|a, b| a <=> b }
p a1 # => ["a", "b", "c", "d", "e"]
a2 = a.sort {|a, b| b <=> a }
p a2 # => ["e", "d", "c", "b", "a"]

a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a1 = a.sort {|a, b| 0 }
p a1 # =>  ["c", "e", "b", "d", "a"]

# sort! → self
# sort! {|a, b| ... } → self
a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a.sort!
p a # => ["a", "b", "c", "d", "e"]

a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a.sort! {|a, b| a <=> b }
p a # => ["a", "b", "c", "d", "e"]
a.sort! {|a, b| b <=> a }
p a # => ["e", "d", "c", "b", "a"]

a = 'abcde'.split('').shuffle
p a # => ["e", "b", "d", "a", "c"]
a.sort! {|a, b| 0 }
p a # => ["d", "e", "c", "a", "b"]

# sort_by! {|element| ... } → self
# sort_by! → new_enumerator
a = ['aaaa', 'bbb', 'cc', 'd']
a.sort_by! {|element| element.size }
p a # => ["d", "cc", "bbb", "aaaa"]

a = ['aaaa', 'bbb', 'cc', 'd']
p a.sort_by! # => #<Enumerator: ["aaaa", "bbb", "cc", "d"]:sort_by!>

# sum(init = 0) → object
# sum(init = 0) {|element| ... } → object
# sum = init
# array.each {|element| sum += element }
# p sum
a = [0, 1, 2, 3]
p a.sum # => 6
p a.sum(100) # => 106

a = ['abc', 'def', 'ghi']
p a.sum('jkl') # => "jklabcdefghi"
a = ['zero', 1, :two]
s = a.sum('Coerced and concatenated: ') {|element| element.to_s }
p s # => "Coerced and concatenated: zero1two"

# take(n) → new_array
a = [0, 1, 2, 3, 4, 5]
p a.take(1) # => [0]
p a.take(2) # => [0, 1]
p a.take(50) # => [0, 1, 2, 3, 4, 5]
p a # => [0, 1, 2, 3, 4, 5]

# take_while {|element| ... } → new_array
# take_while → new_enumerator
a = [0, 1, 2, 3, 4, 5]
p a.take_while {|element| element < 3 } # => [0, 1, 2]
p a.take_while {|element| true } # => [0, 1, 2, 3, 4, 5]
p a # => [0, 1, 2, 3, 4, 5]

p [0, 1].take_while # => #<Enumerator: [0, 1]:take_while>

# to_a → self or new_array
a = [:foo, 'bar', 2]
p a.to_a # => [:foo, "bar", 2]

class MyArray < Array; end
a = MyArray.new(['foo', 'bar', 'two'])
p a.instance_of?(Array) # => false
p a.kind_of?(Array) # => true
a1 = a.to_a
p a1 # => ["foo", "bar", "two"]
p a1.class # => Array # Not MyArray

# to_ary → self
# to_h → new_hash
# to_h {|item| ... } → new_hash
a = ['foo', :bar, 1, [2, 3], {baz: 4}]
h = a.to_h {|item| [item, item] }
p h # => {"foo"=>"foo", :bar=>:bar, 1=>1, [2, 3]=>[2, 3], {:baz=>4}=>{:baz=>4}}

[].to_h # => {}
a = [['foo', 'zero'], ['bar', 'one'], ['baz', 'two']]
h = a.to_h
p h # => {"foo"=>"zero", "bar"=>"one", "baz"=>"two"}

# to_s()
# Also aliased as: old_to_s
# Alias for: inspect

# transpose → new_array
a = [[:a0, :a1], [:b0, :b1], [:c0, :c1]]
p a.transpose # => [[:a0, :b0, :c0], [:a1, :b1, :c1]]

# union(*other_arrays) → new_array
p [0, 1, 2, 3].union([4, 5], [6, 7]) # => [0, 1, 2, 3, 4, 5, 6, 7]
p [0, 1, 1].union([2, 1], [3, 1]) # => [0, 1, 2, 3]
p [0, 1, 2, 3].union([3, 2], [1, 0]) # => [0, 1, 2, 3]

# uniq → new_array
# uniq {|element| ... } → new_array
a = [0, 0, 1, 1, 2, 2]
p a.uniq # => [0, 1, 2]

a = ['a', 'aa', 'aaa', 'b', 'bb', 'bbb']
p a.uniq {|element| element.size } # => ["a", "aa", "aaa"]

# uniq! → self or nil
# uniq! {|element| ... } → self or nil

a = [0, 0, 1, 1, 2, 2]
a.uniq! # => [0, 1, 2]
p a

a = ['a', 'aa', 'aaa', 'b', 'bb', 'bbb']
p a.uniq! {|element| element.size } # => ['a', 'aa', 'aaa']

# unshift(*objects) → self
a = [:foo, 'bar', 2]
p a.unshift(:bam, :bat) # => [:bam, :bat, :foo, "bar", 2]

# values_at(*indexes) → new_array

a = [:foo, 'bar', 2]
p a.values_at(0, 2) # => [:foo, 2]
p a.values_at(0..1) # => [:foo, "bar"]

a = [:foo, 'bar', 2]
p a.values_at(2, 0, 1, 0, 2) # => [2, :foo, "bar", :foo, 2]
p a.values_at(1, 0..2) # => ["bar", :foo, "bar", 2]

a = [:foo, 'bar', 2]
p a.values_at(0, 3, 1, 3) # => [:foo, nil, "bar", nil]

a = [:foo, 'bar', 2]
p a.values_at(-1, -3) # => [2, :foo]

a = [:foo, 'bar', 2]
p a.values_at(0, -5, 1, -6, 2) # => [:foo, nil, "bar", nil, 2]

a = [:foo, 'bar', 2]
p a.values_at(0, -2, 1, -1) # => [:foo, "bar", "bar", 2]

# zip(*other_arrays) → new_array
# zip(*other_arrays) {|other_array| ... } → nil

a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2, :b3]
c = [:c0, :c1, :c2, :c3]
d = a.zip(b, c)
p d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2]
c = [:c0, :c1]
d = a.zip(b, c)
p d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, nil], [:a3, nil, nil]]

a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2, :b3, :b4]
c = [:c0, :c1, :c2, :c3, :c4, :c5]
d = a.zip(b, c)
p d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2, :b3]
c = [:c0, :c1, :c2, :c3]
p a.zip(b, c) {|sub_array| p sub_array} # => nil
# [:a0, :b0, :c0]
# [:a1, :b1, :c1]
# [:a2, :b2, :c2]
# [:a3, :b3, :c3]

# array | other_array → new_array
p [0, 1] | [2, 3] # => [0, 1, 2, 3]
p [0, 1, 1] | [2, 2, 3] # => [0, 1, 2, 3]
p [0, 1, 2] | [3, 2, 1, 0] # => [0, 1, 2, 3]