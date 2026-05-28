grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
options = { :font_size => 10, :font_family => "Arial" }
p options[:font_size]  # => 10
options = { font_size: 10, font_family: "Arial" }
p options[:font_size]  # => 10
grades = Hash.new
grades["Dorothy Doe"] = 9
grades = Hash.new(0)
grades = {"Timmy Doe" => 8}
grades.default = 21
puts grades["Jane Doe"] # => 21
puts grades["Timmy Doe"] # => 8

books         = {}
books[:matz]  = "The Ruby Programming Language"
books[:black] = "The Well-Grounded Rubyist"
p books

# Hashes are also commonly used as a way to have named parameters in functions. Note that no brackets are used below. If a hash is the last argument on a method call, no braces are needed, thus creating a really clean interface:
# Person.create(name: "John Doe", age: 27)
# def self.create(params)
#   @name = params[:name]
#   @age  = params[:age]
# end

p "=============HASH Key====================="
class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def ==(other)
    self.class === other and
      other.author == @author and
      other.title == @title
  end

  alias eql? ==

  def hash
    @author.hash ^ @title.hash # XOR
  end
end

book1 = Book.new 'matz', 'Ruby in a Nutshell'
book2 = Book.new 'matz', 'Ruby in a Nutshell'

reviews = {}

reviews[book1] = 'Great reference!'
reviews[book2] = 'Nice and compact!'

p reviews
p reviews.length #=> 1

p "=================Public Class Methods================="
# Hash[ key, value, ... ] → new_hash
# Hash[ [ [key, value], ... ] ] → new_hash
# Hash[ object ] → new_hash
p Hash["a", 100, "b", 200]             #=> {"a"=>100, "b"=>200}
p Hash[ [ ["a", 100], ["b", 200] ] ]   #=> {"a"=>100, "b"=>200}
p Hash["a" => 100, "b" => 200]         #=> {"a"=>100, "b"=>200}

# new → new_hash
# new(obj) → new_hash
# new {|hash, key| block } → new_hash
h = Hash.new("Go Fish")
h["a"] = 100
h["b"] = 200
p h["a"]           #=> 100
p h["c"]           #=> "Go Fish"
# The following alters the single default object
p h["c"].upcase!   #=> "GO FISH"
p h["d"]           #=> "GO FISH"
p h
p h.keys           #=> ["a", "b"]

# While this creates a new default object each time
h = Hash.new { |hash, key| hash[key] = "Go Fish: #{key}" }
p h["c"]           #=> "Go Fish: c"
p h["c"].upcase!   #=> "GO FISH: C"
p h["d"]           #=> "Go Fish: d"
p h.keys           #=> ["c", "d"]

# ruby2_keywords_hash(hash) → hash
h = {k: 1}
h = Hash.ruby2_keywords_hash(h)
def foo(k: 42)
  k
end
p foo(*[h]) #=> 1 with neither a warning or an error

# ruby2_keywords_hash?(hash) → true or false
# Checks if a given hash is flagged by Module#ruby2_keywords (or Proc#ruby2_keywords). This method is not for casual use; debugging, researching, and some truly necessary cases like serialization of arguments.
ruby2_keywords def foo(*args)
    Hash.ruby2_keywords_hash?(args.last)
end
p foo(k: 1)   #=> true
p foo({k: 1}) #=> false

# try_convert(obj) → hash or nil
# Try to convert obj into a hash, using #to_hash method. Returns converted hash or nil if obj cannot be converted for any reason.
p Hash.try_convert({1=>2})   # => {1=>2}
p Hash.try_convert("1=>2")   # => nil

p "================Public Instance Methods========"
# hash < other → true or false
h1 = {a:1, b:2}
h2 = {a:1, b:2, c:3}
p h1 < h2    #=> true
p h2 < h1    #=> false
p h1 < h1    #=> false

# hash <= other → true or false
p h1 <= h2   #=> true
p h2 <= h1   #=> false
p h1 <= h1   #=> true

# hsh == other_hash → true or false
h1 = { "a" => 1, "c" => 2 }
h2 = { 7 => 35, "c" => 2, "a" => 1 }
h3 = { "a" => 1, "c" => 2, 7 => 35 }
h4 = { "a" => 1, "d" => 2, "f" => 35 }
p h1 == h2   #=> false
p h2 == h3   #=> true
p h3 == h4   #=> false

h1 = { "a" => 1, "c" => 2 }
h2 = { "c" => 2, "a" => 1 }
p h1 == h2   #=> true

# hash > other → true or false
h1 = {a:1, b:2}
h2 = {a:1, b:2, c:3}
p h1 > h2    #=> false
p h2 > h1    #=> true
p h1 > h1    #=> false

# hash >= other → true or false
h1 = {a:1, b:2}
h2 = {a:1, b:2, c:3}
p h1 >= h2   #=> false
p h2 >= h1   #=> true
p h1 >= h1   #=> true

# hsh[key] → value
h = { "a" => 100, "b" => 200 }
p h["a"]   #=> 100
p h["c"]   #=> nil

# hsh[key] = value → value
h = { "a" => 100, "b" => 200 }
h["a"] = 9
h["c"] = 4
p h   #=> {"a"=>9, "b"=>200, "c"=>4}
h.store("d", 42) #=> 42
p h   #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}

a = "a"
b = "b".freeze
h = { a => 100, b => 200 }
p h.key(100)
p h.key(100).equal? a #=> false
p h.key(200).equal? b #=> true

# any? [{ |(key, value)| block }] → true or false
# any?(pattern) → true or false
hash = { a: 1, b: 2, c: 3 }
p hash.any? { |key, value| value > 2 }
p hash.any? { |k, v| k == :z }

users = [
  { name: "Alice", admin: false },
  { name: "Bob", admin: true }
]

p users.any? { |user| user[:admin] }
# => true
h = { a: 1, b: 2, c: 3 }
p h.any?([:a, 1]) # => true
h = { a: 1, b: 2 }
p h.any?(Array) #=> false
h = { apple: 1, banana: 2 }
p h.any?(/app/) # => false

# assoc(obj) → an_array or nil
h = {"colors"  => ["red", "blue", "green"],
     "letters" => ["a", "b", "c" ], "test" => "value"}
p h.assoc("letters")  #=> ["letters", ["a", "b", "c"]]
p h.assoc("foo")      #=> nil
p h.assoc("test")      #=> ["test", "value"]

# clear → hsh
h = { "a" => 100, "b" => 200 }   #=> {"a"=>100, "b"=>200}
h.clear                          #=> {}
p h

# compact → new_hash
h = { a: 1, b: false, c: nil }
p h.compact     #=> { a: 1, b: false }
p h             #=> { a: 1, b: false, c: nil }

# compact! → hsh or nil
h = { a: 1, b: false, c: nil }
p h.compact!     #=> { a: 1, b: false }
p h     #=> { a: 1, b: false }

# compare_by_identity → hsh
# Makes hsh compare its keys by their identity, i.e. it will consider exact same objects as same keys.
# compare_by_identity? → true or false
# Returns true if hsh will compare its keys by their identity. Also see #compare_by_identity.
h1 = { "a" => 100, "b" => 200, :c => "c" }
h1["a"]        #=> 100
h1.compare_by_identity
h1.compare_by_identity? #=> true
p h1["a".dup]    #=> nil  # different objects.
p h1[:c]         #=> "c"  # same symbols are all same.

# deconstruct_keys(p1)
# p1 = Point.new(5, 7)
# puts p1.deconstruct_keys([:x])
# => {:x=>5}

# default(key=nil) → obj
h = Hash.new                            #=> {}
p h.default                               #=> nil
p h.default(2)                            #=> nil

h = Hash.new("cat")                     #=> {}
p h.default                               #=> "cat"
p h.default(2)                            #=> "cat"

h = Hash.new {|h,k| h[k] = k.to_i*10}   #=> {}
p h.default                               #=> nil
p h.default(2)                            #=> 20

# default = obj → obj
h = { "a" => 100, "b" => 200 }
h.default = "Go fish"
p h["a"]     #=> 100
p h["z"]     #=> "Go fish"
# This doesn't do what you might hope...
h.default = proc do |hash, key|
  hash[key] = key + key
end
p h[2]       #=> #<Proc:0x401b3948@-:6>
p h["cat"]   #=> #<Proc:0x401b3948@-:6>

# default_proc → anObject
# h = Hash.new {|h,k| h[k] = k * k }   #=> {}
# p p = h.default_proc                 #=> #<Proc:0x401b3d08@-:1>
# a = []                             #=> []
# p p.call(a, 2)
# p a                                  #=> [nil, nil, 4]

# default_proc = proc_obj or nil
h.default_proc = proc do |hash, key|
  hash[key] = key + key
end
p h[2]       #=> 4
p h["cat"]   #=> "catcat"

# delete(key) → value
# delete(key) {| key | block } → value
h = { "a" => 100, "b" => 200 }
p h.delete("a")                              #=> 100
p h.delete("z")                              #=> nil
p h.delete("z") { |el| "#{el} not found" }   #=> "z not found"

# delete_if {| key, value | block } → hsh
# delete_if → an_enumerator
h = { "a" => 100, "b" => 200, "c" => 300 }
p h.delete_if {|key, value| key >= "b" }   #=> {"a"=>100}

# dig(key, ...) → object
h = { foo: {bar: {baz: 1}}}

p h.dig(:foo, :bar, :baz)     #=> 1
p h.dig(:foo, :zot, :xyz)     #=> nil

g = { foo: [10, 11, 12] }
p g.dig(:foo, 1)              #=> 11
# p g.dig(:foo, 1, 0)           #=> TypeError: Integer does not have #dig method
# p g.dig(:foo, :bar)           #=> TypeError: no implicit conversion of Symbol into Integer

# each {| key, value | block } → hsh
# each_pair {| key, value | block } → hsh
# each → an_enumerator
# each_pair → an_enumerator
h = { "a" => 100, "b" => 200 }
h.each {|key, value| puts "#{key} is #{value}" }
# a is 100
# b is 200

# each_key {| key | block } → hsh
# each_key → an_enumerator
h = { "a" => 100, "b" => 200 }
h.each_key {|key| puts key }
# a b

# each_pair {| key, value | block } → hsh
# each_pair → an_enumerator
h = { "a" => 100, "b" => 200 }
h.each {|key, value| puts "#{key} is #{value}" }
# a is 100
# b is 200

# each_value {| value | block } → hsh
# each_value → an_enumerator
h = { "a" => 100, "b" => 200 }
h.each_value {|value| puts value }
# 100
# 200

# empty? → true or false
h = { a: "1" }
p h.empty?
p({}.empty?) # true 

# eql?(other) → true or false
a =  { "a" => 100, "b" => 200 }
b =  { "a" => 100, "b" => 200 }
c =  { "b" => 200, "a" => 100 }
p a.eql? b # true
p a.eql? c #true

# fetch(key [, default] ) → obj
# fetch(key) {| key | block } → obj
h = { "a" => 100, "b" => 200 }
p h.fetch("a")                            #=> 100
p h.fetch("z", "go fish")                 #=> "go fish"
p h.fetch("z") { |el| "go fish, #{el}"}   #=> "go fish, z"

h = { "a" => 100, "b" => 200 }
# p h.fetch("z") # `fetch': key not found (KeyError)

# fetch_values(key, ...) → array
# fetch_values(key, ...) { |key| block } → array

h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
p h.fetch_values("cow", "cat")                   #=> ["bovine", "feline"]
# p h.fetch_values("cow", "bird")                  # raises KeyError
p h.fetch_values("cow", "bird") { |k| k.upcase } #=> ["bovine", "BIRD"]

# filter {|key, value| block} → a_hash
# filter → an_enumerator
# select {|key, value| block} → a_hash
# select → an_enumerator
h = { "a" => 100, "b" => 200, "c" => 300 }
p h.select {|k,v| k > "a"}  #=> {"b" => 200, "c" => 300}
p h.select {|k,v| v < 200}  #=> {"a" => 100}

# filter! {| key, value | block } → hsh or nil
# filter! → an_enumerator
# select! {| key, value | block } → hsh or nil
# select! → an_enumerator
h = { "a" => 100, "b" => 200, "c" => 300 }
p h.select!{|k,v| k > "a"}  #=> {"b"=>200, "c"=>300}
p h #=> {"b"=>200, "c"=>300}
p h.select!{|k,v| v > 200}  #=> {"c"=>300}

# flatten → an_array
# flatten(level) → an_array
a =  {1=> "one", 2 => [2,"two"], 3 => "three"}
p a.flatten    # => [1, "one", 2, [2, "two"], 3, "three"]
p a.flatten(2) # => [1, "one", 2, 2, "two", 3, "three"]

# has_key?(key) → true or false
# include?(key) → true or false
h = { "a" => 100, "b" => 200 }
p h.has_key?("a")   #=> true
p h.has_key?("z")   #=> false

# has_value?(value) → true or false
h = { "a" => 100, "b" => 200 }
p h.value?(100)   #=> true
p h.value?(999)   #=> false

# hash → integer
p h.hash # 2151458889891202414

# replace(other_hash) → hsh
h = { "a" => 100, "b" => 200 }
h.replace({ "c" => 300, "d" => 400 })   #=> {"c"=>300, "d"=>400}
p h #=> {"c"=>300, "d"=>400}

# to_s → string
# inspect → string
h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
p h.to_s   #=> "{\"c\"=>300, \"a\"=>100, \"d\"=>400}"
p h.inspect #=> "{\"c\"=>300, \"a\"=>100, \"d\"=>400}"

# invert → new_hash
h = { "n" => 100, "m" => 100, "y" => 300, "d" => 200, "a" => 0 }
p h.invert   #=> {100=>"m", 300=>"y", 200=>"d", 0=>"a"}

h = { a: 1, b: 3, c: 4 }
p h.invert.invert == h #=> true

# no key with the same value
h = { a: 1, b: 3, c: 4 }
p h.size == h.invert.size #=> true

# two (or more) keys has the same value
h = { a: 1, b: 3, c: 1 }
p h.size == h.invert.size #=> false

# keep_if {| key, value | block } → hsh
# keep_if → an_enumerator
h = { a: 1, b: 2, c: 3, d: 4 }
h.keep_if { |key, value| value.even? }
p h # {:b=>2, :d=>4}

h = { a: 1, b: 2 }
enum = h.keep_if
p enum # #<Enumerator: {:a=>1, :b=>2}:keep_if>

# key(value) → key
h = { "a" => 100, "b" => 200, "c" => 300, "d" => 300 }
p h.key(200)   #=> "b"
p h.key(300)   #=> "c"
p h.key(999)   #=> nil

# key?(key) → true or false
# member?(key) → true or falseh = { "a" => 100, "b" => 200 }
p h.has_key?("a")   #=> true
p h.has_key?("z")   #=> false

# keys → array
h = { "a" => 100, "b" => 200, "c" => 300, "d" => 400 }
p h.keys   #=> ["a", "b", "c", "d"]

# size → integer
# length → integer
h = { "d" => 100, "a" => 200, "v" => 300, "e" => 400 }
p h.size          #=> 4
p h.delete("a")   #=> 200
p h.size          #=> 3
p h.length        #=> 3

# merge(other_hash1, other_hash2, ...) → new_hash
# merge(other_hash1, other_hash2, ...) {|key, oldval, newval| block} → new_hash
# update(other_hash1, other_hash2, ...) → hsh
# update(other_hash1, other_hash2, ...) {|key, oldval, newval| block}
h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
h3 = { "b" => 357, "d" => 400 }
p h1.merge          #=> {"a"=>100, "b"=>200}
p h1.merge(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
p h1.merge(h2, h3)  #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
p h1.merge(h2) {|key, oldval, newval| newval - oldval}
                  #=> {"a"=>100, "b"=>46,  "c"=>300}
p h1.merge(h2, h3) {|key, oldval, newval| newval - oldval}
                  #=> {"a"=>100, "b"=>311, "c"=>300, "d"=>400}
p h1                #=> {"a"=>100, "b"=>200}

# merge!(other_hash1, other_hash2, ...) → hsh
# merge!(other_hash1, other_hash2, ...) {|key, oldval, newval| block}
h1 = { "a" => 100, "b" => 200 }
p h1.merge!          #=> {"a"=>100, "b"=>200}
p h1                 #=> {"a"=>100, "b"=>200}

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
p h1.merge!(h2)      #=> {"a"=>100, "b"=>246, "c"=>300}
p h1                 #=> {"a"=>100, "b"=>246, "c"=>300}

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
h3 = { "b" => 357, "d" => 400 }
p h1.merge!(h2, h3)
                   #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}
p h1                 #=> {"a"=>100, "b"=>357, "c"=>300, "d"=>400}

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 246, "c" => 300 }
h3 = { "b" => 357, "d" => 400 }
p h1.merge!(h2, h3) {|key, v1, v2| v1 }
                   #=> {"a"=>100, "b"=>200, "c"=>300, "d"=>400}
p h1                 #=> {"a"=>100, "b"=>200, "c"=>300, "d"=>400}

# rassoc(obj) → an_array or nil
a = {1=> "one", 2 => "two", 3 => "three", "ii" => "two"}
p a.rassoc("two")    #=> [2, "two"]
p a.rassoc("four")   #=> nil

# rehash → hsh
a = [ "a", "b" ]
c = [ "c", "d" ]
h = { a => 100, c => 300 }
p h[a]       #=> 100
a[0] = "z"
p h[a]       #=> nil
p h.rehash   #=> {["z", "b"]=>100, ["c", "d"]=>300}
p h[a]       #=> 100

# reject {|key, value| block} → a_hash
# reject → an_enumerator
# reject! {| key, value | block } → hsh or nil
# reject! → an_enumerator
h = { "a" => 100, "b" => 200, "c" => 300 }
p h.reject {|k,v| k < "b"}  #=> {"b" => 200, "c" => 300}
p h.reject {|k,v| v > 100}  #=> {"a" => 100}

# replace(other_hash) → hsh
h = { "a" => 100, "b" => 200 }
p h.replace({ "c" => 300, "d" => 400 })   #=> {"c"=>300, "d"=>400}

# shift → anArray or obj
h = { 1 => "a", 2 => "b", 3 => "c" }
p h.shift   #=> [1, "a"]
p h         #=> {2=>"b", 3=>"c"}

# slice(*keys) → a_hash
h = { a: 100, b: 200, c: 300 }
p h.slice(:a)           #=> {:a=>100}
p h.slice(:b, :c, :d)   #=> {:b=>200, :c=>300}

# store(key, value) → value
h = { "a" => 100, "b" => 200 }
h["a"] = 9
h["c"] = 4
p h   #=> {"a"=>9, "b"=>200, "c"=>4}
p h.store("d", 42) #=> 42
p h   #=> {"a"=>9, "b"=>200, "c"=>4, "d"=>42}

# to_a → array
h = { "c" => 300, "a" => 100, "d" => 400, "c" => 300  }
p h.to_a   #=> [["c", 300], ["a", 100], ["d", 400]]

# to_h → hsh or new_hash
# to_h {|key, value| block } → new_hash
# to_hash => hsh

# to_proc → proc
h = {a:1, b:2}
hp = h.to_proc
p hp.call(:a)          #=> 1
p hp.call(:b)          #=> 2
p hp.call(:c)          #=> nil
p [:a, :b, :c].map(&h) #=> [1, 2, nil]

# transform_keys {|key| block } → new_hash
# transform_keys → an_enumerator
h = { a: 1, b: 2, c: 3 }
p h.transform_keys {|k| k.to_s }  #=> { "a" => 1, "b" => 2, "c" => 3 }
p h.transform_keys(&:to_s)        #=> { "a" => 1, "b" => 2, "c" => 3 }
p h.transform_keys.with_index {|k, i| "#{k}.#{i}" }
                                #=> { "a.0" => 1, "b.1" => 2, "c.2" => 3 }

# transform_keys! {|key| block } → hsh
# transform_keys! → an_enumerator
h = { a: 1, b: 2, c: 3 }
p h.transform_keys! {|k| k.to_s }  #=> { "a" => 1, "b" => 2, "c" => 3 }
p h.transform_keys!(&:to_sym)      #=> { a: 1, b: 2, c: 3 }
p h.transform_keys!.with_index {|k, i| "#{k}.#{i}" }
                                 #=> { "a.0" => 1, "b.1" => 2, "c.2" => 3 }


# transform_values {|value| block } → new_hash
# transform_values → an_enumerator
h = { a: 1, b: 2, c: 3 }
p h.transform_values {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
p h.transform_values(&:to_s)           #=> { a: "1", b: "2", c: "3" }
p h.transform_values.with_index {|v, i| "#{v}.#{i}" }
                                     #=> { a: "1.0", b: "2.1", c: "3.2" }

# transform_values! {|value| block } → hsh
# transform_values! → an_enumerator
h = { a: 1, b: 2, c: 3 }
p h.transform_values! {|v| v * v + 1 }  #=> { a: 2, b: 5, c: 10 }
p h.transform_values!(&:to_s)           #=> { a: "2", b: "5", c: "10" }
p h.transform_values!.with_index {|v, i| "#{v}.#{i}" }
                                      #=> { a: "2.0", b: "5.1", c: "10.2" }

# value?(value) → true or false
h = { "a" => 100, "b" => 200 }
p h.value?(100)   #=> true
p h.value?(999)   #=> false

# values → array
h = { "a" => 100, "b" => 200, "c" => 300 }
p h.values   #=> [100, 200, 300]

# values_at(key, ...) → array
h = { "cat" => "feline", "dog" => "canine", "cow" => "bovine" }
p h.values_at("cow", "cat")  #=> ["bovine", "feline"]

h = {foo: 0, :bar => 1, 'baz': 2}
p h # => {:foo=>0, :bar=>1, :baz=>2}

x = 0
y = 100
h = {x:, y:}
p h # => {:x=>0, :y=>100}

def some_method(hash)
  p hash
end
some_method({foo: 0, bar: 1, baz: 2}) # => {:foo=>0, :bar=>1, :baz=>2}

class Dev
  attr_accessor :name, :language
  def initialize(hash)
    self.name = hash[:name]
    self.language = hash[:language]
  end
end
matz = Dev.new(name: 'Matz', language: 'Ruby')
p matz # => #<Dev: @name="Matz", @language="Ruby">

h = Hash[foo: 0, bar: 1, baz: 2]
p h # => {:foo=>0, :bar=>1, :baz=>2}

a0 = [ :foo, :bar ]
a1 = [ :baz, :bat ]
h = {a0 => 0, a1 => 1}
p h.include?(a0) # => true
p h[a0] # => 0
p a0.hash # => 110002110

a0[0] = :bam
p a0.hash # => 1069447059
p h.include?(a0) # => false
p h[a0] # => nil

p h.rehash # => {[:bam, :bar]=>0, [:baz, :bat]=>1}
p h.include?(a0) # => true
p h[a0] # => 0


class Book
  attr_reader :author, :title

  def initialize(author, title)
    @author = author
    @title = title
  end

  def ==(other)
    self.class === other &&
      other.author == @author &&
      other.title == @title
  end

  alias eql? ==

  def hash
    [self.class, @author, @title].hash
  end
end

book1 = Book.new 'matz', 'Ruby in a Nutshell'
book2 = Book.new 'matz', 'Ruby in a Nutshell'

reviews = {}

reviews[book1] = 'Great reference!'
reviews[book2] = 'Nice and compact!'

p reviews.length #=> 1

# except(*keys) → a_hash
h = { a: 100, b: 200, c: 300 }
p h.except(:a)          #=> {:b=>200, :c=>300}


# initialize_copy(other_hash) -> self
h = {foo: 0, bar: 1, baz: 2}
p h.replace({bat: 3, bam: 4}) # => {:bat=>3, :bam=>4}