# Module Enumerable provides methods that are useful to a collection class for:
require 'uri'

class Foo
  include Enumerable
  def each
    yield 1
    yield 1, 2
    yield
  end
end
Foo.new.each_entry{ |element| p element }

# all? → true or false
# all?(pattern) → true or false
# all? {|element| ... } → true or false
p (1..4).all?           # => true
p %w[a b c d].all?      # => true
p [1, 2, nil].all?      # => false
p ['a','b', false].all? # => false
p [].all?               # => true
p (1..4).all?(Integer)                 # => true
p (1..4).all?(Numeric)                 # => true
p (1..4).all?(Float)                   # => false
p %w[bar baz bat bam].all?(/ba/)       # => true
p %w[bar baz bat bam].all?(/bar/)      # => false
p %w[bar baz bat bam].all?('ba')       # => false
p({ foo: 0, bar: 1, baz: 2 }.all?(Array)) # => true
p({foo: 0, bar: 1, baz: 2}.all?(Hash))  # => false
# p [].all?(Integer)                     # => true

p (1..4).all? {|element| element < 5 }                    # => true
p (1..4).all? {|element| element < 4 }                    # => false
p ({foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 3 }) # => true
p ({foo: 0, bar: 1, baz: 2}.all? {|key, value| value < 2 }) # => false

# any? → true or false
# any?(pattern) → true or false
# any? {|element| ... } → true or false
p (1..4).any?          # => true
p %w[a b c d].any?     # => true
p [1, false, nil].any? # => true
p [].any?              # => false
p [nil, false, 0].any?(Integer)        # => true
p [nil, false, 0].any?(Numeric)        # => true
p [nil, false, 0].any?(Float)          # => false
p %w[bar baz bat bam].any?(/m/)        # => true
p %w[bar baz bat bam].any?(/foo/)      # => false
p %w[bar baz bat bam].any?('ba')       # => false
p ({foo: 0, bar: 1, baz: 2}.any?(Array)) # => true
p ({foo: 0, bar: 1, baz: 2}.any?(Hash) ) # => false
p [].any?(Integer)                     # => false
p (1..4).any? {|element| element < 2 }                    # => true
p (1..4).any? {|element| element < 1 }                    # => false
p ({foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 1 }) # => true
p ({foo: 0, bar: 1, baz: 2}.any? {|key, value| value < 0 }) # => false

# chain(*enums) → enumerator
# to_a(*args) → array
e = (1..3).chain([4, 5])
p e.to_a #=> [1, 2, 3, 4, 5]

# chunk {|array| ... } → enumerator
e = (0..10).chunk {|i| (i / 3).floor } # => #<Enumerator: ...>
p e.next
p e.next

# # Get sorted words from a web page.
# url = 'https://raw.githubusercontent.com/eneko/data-repository/master/data/words.txt'
# words = URI::open(url).readlines
# # Make chunks, one for each letter.
# e = words.chunk {|word| word.upcase[0] } # => #<Enumerator: ...>
# # Display 'A' through 'F'.
# e.each {|c, words| p [c, words.length]; break if c == 'F' }

a = [0, 0, 1, 1]
e = a.chunk{|i| i.even? ? :_alone : true }
p e.to_a # => [[:_alone, [0]], [:_alone, [0]], [true, [1, 1]]]

a = [0, 0, -1, 1, 1]
e = a.chunk{|i| i < 0 ? :_separator : true }
p e.to_a # => [[true, [0, 0]], [true, [1, 1]]]

a = [0, 0, -1, 1, -1, 1]
e = a.chunk{|i| i < 0 ? :_separator : true }
p e.to_a # => [[true, [0, 0]], [true, [1]], [true, [1]]]

# chunk_while {|elt_before, elt_after| bool } → an_enumerator
a = [1,2,4,9,10,11,12,15,16,19,20,21]
b = a.chunk_while {|i, j| i+1 == j }
p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
d = c.join(",")
p d #=> "1,2,4,9-12,15,16,19-21"

a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
p a.chunk_while {|i, j| i <= j }.to_a
#=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]

a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
p a.chunk_while {|i, j| i.even? == j.even? }.to_a
#=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]

# collect -> enumerator
(0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
p ({foo: 0, bar: 1, baz: 2}.map {|key, value| value*2}) # => [0, 2, 4]

# collect_concat()
p [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
p [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
p [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
p({foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] }) # => [:foo, 0, :bar, 1, :baz, 2]

# compact → array
a = [nil, 0, nil, 'a', false, nil, false, nil, 'a', nil, 0, nil]
p a.compact # => [0, "a", false, false, "a", 0]

# count → integer
# count(object) → integer
# count {|element| ... } → integer
p [0, 1, 2].count                # => 3
{foo: 0, bar: 1, baz: 2}.count # => 3

p [0, 1, 2, 1].count(1)           # => 2
p [0, 1, 2, 3].count {|element| element < 2}              # => 2
{foo: 0, bar: 1, baz: 2}.count {|key, value| value < 2} # => 2

# cycle(n = nil) {|element| ...} → nil
# cycle(n = nil) → enumerator
a = []
(1..4).cycle(3) {|element| a.push(element) } # => nil
p a # => [1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4]
a = []
('a'..'d').cycle(2) {|element| a.push(element) }
p a # => ["a", "b", "c", "d", "a", "b", "c", "d"]
a = []
{foo: 0, bar: 1, baz: 2}.cycle(2) {|element| a.push(element) }
p a # => [[:foo, 0], [:bar, 1], [:baz, 2], [:foo, 0], [:bar, 1], [:baz, 2]]

# detect(*args)
# find(if_none_proc = nil) {|element| ... } → object or nil
# find(if_none_proc = nil) → enumerator
p (0..9).find {|element| element > 2}                # => 3
p (0..9).find(proc {false}) {|element| element > 12} # => false
p ({foo: 0, bar: 1, baz: 2}.find {|key, value| key.start_with?('b') })            # => [:bar, 1]
p ({foo: 0, bar: 1, baz: 2}.find(proc {[]}) {|key, value| key.start_with?('c') }) # => []

# drop(n) → array
r = (1..4)
p r.drop(3)  # => [4]
p r.drop(2)  # => [3, 4]
p r.drop(1)  # => [2, 3, 4]
p r.drop(0)  # => [1, 2, 3, 4]
p r.drop(50) # => []
h = {foo: 0, bar: 1, baz: 2, bat: 3}
p h.drop(2) # => [[:baz, 2], [:bat, 3]]

# drop_while {|element| ... } → array
# drop_while → enumerator
(1..4).drop_while{|i| i < 3 } # => [3, 4]
h = {foo: 0, bar: 1, baz: 2}
a = h.drop_while{|element| key, value = *element; value < 2 }
p a # => [[:baz, 2]]

# each_cons(n) { ... } → self
# each_cons(n) → enumerator
a = []
(1..5).each_cons(3) {|element| a.push(element) }
p a # => [[1, 2, 3], [2, 3, 4], [3, 4, 5]]

a = []
h = {foo: 0,  bar: 1, baz: 2, bam: 3}
h.each_cons(2) {|element| a.push(element) }
p a # => [[[:foo, 0], [:bar, 1]], [[:bar, 1], [:baz, 2]], [[:baz, 2], [:bam, 3]]]

# each_entry(*args) {|element| ... } → self
# each_entry(*args) → enumerator
a = []
(1..4).each_entry {|element| a.push(element) } # => 1..4
a # => [1, 2, 3, 4]

a = []
h = {foo: 0, bar: 1, baz:2}
h.each_entry {|element| a.push(element) }
# => {:foo=>0, :bar=>1, :baz=>2}
p a # => [[:foo, 0], [:bar, 1], [:baz, 2]]

class Foo
  include Enumerable
  def each
    yield 1
    yield 1, 2
    yield
  end
end
Foo.new.each_entry {|yielded| p yielded }

# each_slice(n) { ... } → self
# each_slice(n) → enumerator
a = []
(1..10).each_slice(3) {|tuple| a.push(tuple) }
p a # => [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

a = []
h = {foo: 0, bar: 1, baz: 2, bat: 3, bam: 4}
h.each_slice(2) {|tuple| a.push(tuple) }
p a # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]], [[:bam, 4]]]

# each_with_index(*args) {|element, i| ..... } → self
# each_with_index(*args) → enumerator
h = {}
(1..4).each_with_index {|element, i| h[element] = i } # => 1..4
p h # => {1=>0, 2=>1, 3=>2, 4=>3}

h = {}
%w[a b c d].each_with_index {|element, i| h[element] = i }
# => ["a", "b", "c", "d"]
p h # => {"a"=>0, "b"=>1, "c"=>2, "d"=>3}

a = []
h = {foo: 0, bar: 1, baz: 2}
h.each_with_index {|element, i| a.push([i, element]) }
# => {:foo=>0, :bar=>1, :baz=>2}
p a # => [[0, [:foo, 0]], [1, [:bar, 1]], [2, [:baz, 2]]]

# each_with_object(object) { |(*args), memo_object| ... } → object
# each_with_object(object) → enumerator
p (1..4).each_with_object([]) {|i, a| a.push(i**2) }
# => [1, 4, 9, 16]
p ({foo: 0, bar: 1, baz: 2}.each_with_object({}) {|(k, v), h| h[v] = k })
# => {0=>:foo, 1=>:bar, 2=>:baz}

# entries(*args)
p (0..4).to_a # => [0, 1, 2, 3, 4]

# filter()
# find_all -> enumerator
# select {|element| ... } → array
# select → enumerator
p (0..9).select {|element| element % 3 == 0 } # => [0, 3, 6, 9]
a = {foo: 0, bar: 1, baz: 2}.select {|key, value| key.start_with?('b') }
p a # => {:bar=>1, :baz=>2}

# filter_map {|element| ... } → array
# filter_map → enumerator
p (0..9).filter_map {|i| i * 2 if i.even? }                              # => [0, 4, 8, 12, 16]
p ({foo: 0, bar: 1, baz: 2}.filter_map {|key, value| key if value.even? }) # => [:foo, :baz]

# find_index(object) → integer or nil
# find_index {|element| ... } → integer or nil
# find_index → enumerator
p ['a', 'b', 'c', 'b'].find_index('b') # => 1
p ['a', 'b', 'c', 'b'].find_index {|element| element.start_with?('b') } # => 1
p ({foo: 0, bar: 1, baz: 2}.find_index {|key, value| value > 1 })         # => 2

# first → element or nil
# first(n) → array
p (1..4).first                   # => 1
p %w[a b c].first                # => "a"
p ({foo: 1, bar: 1, baz: 2}.first) # => [:foo, 1]
p [].first                       # => nil

p (1..4).first(2)                   # => [1, 2]
p %w[a b c d].first(3)              # => ["a", "b", "c"]
p %w[a b c d].first(50)             # => ["a", "b", "c", "d"]
p ({foo: 1, bar: 1, baz: 2}.first(2)) # => [[:foo, 1], [:bar, 1]]
p [].first(2)                       # => []

# flat_map {|element| ... } → array
# flat_map → enumerator
p [0, 1, 2, 3].flat_map {|element| -element }                    # => [0, -1, -2, -3]
p [0, 1, 2, 3].flat_map {|element| [element, -element] }         # => [0, 0, 1, -1, 2, -2, 3, -3]
p [[0, 1], [2, 3]].flat_map {|e| e + [100] }                     # => [0, 1, 100, 2, 3, 100]
p ({foo: 0, bar: 1, baz: 2}.flat_map {|key, value| [key, value] }) # => [:foo, 0, :bar, 1, :baz, 2]

# grep(pattern) → array
# grep(pattern) {|element| ... } → array
a = ['foo', 'bar', 'car', 'moo']
p a.grep(/ar/)                   # => ["bar", "car"]
p (1..10).grep(3..8)             # => [3, 4, 5, 6, 7, 8]
p ['a', 'b', 0, 1].grep(Integer) # => [0, 1]
a = ['foo', 'bar', 'car', 'moo']
p a.grep(/ar/) {|element| element.upcase } # => ["BAR", "CAR"]

# grep_v(pattern) → array
# grep_v(pattern) {|element| ... } → array
a = ['foo', 'bar', 'car', 'moo']
p a.grep_v(/ar/)                   # => ["foo", "moo"]
p (1..10).grep_v(3..8)             # => [1, 2, 9, 10]
p ['a', 'b', 0, 1].grep_v(Integer) # => ["a", "b"]
a = ['foo', 'bar', 'car', 'moo']
p a.grep_v(/ar/) {|element| element.upcase } # => ["FOO", "MOO"]

# group_by {|element| ... } → hash
# group_by → enumerator
g = (1..6).group_by {|i| i%3 }
p g # => {1=>[1, 4], 2=>[2, 5], 0=>[3, 6]}
h = {foo: 0, bar: 1, baz: 0, bat: 1}
g = h.group_by {|key, value| value }
p g # => {0=>[[:foo, 0], [:baz, 0]], 1=>[[:bar, 1], [:bat, 1]]}

# include?(object) → true or false
# member?(object) -> true or false
p (1..4).include?(2)                       # => true
p (1..4).include?(5)                       # => false
p (1..4).include?('2')                     # => false
p %w[a b c d].include?('b')                # => true
p %w[a b c d].include?('2')                # => false
p ({foo: 0, bar: 1, baz: 2}.include?(:foo))  # => true
p ({foo: 0, bar: 1, baz: 2}.include?('foo')) # => false
p ({foo: 0, bar: 1, baz: 2}.include?(0))     # => false

# inject(symbol) → object
# inject(initial_value, symbol) → object
# inject {|memo, value| ... } → object
# inject(initial_value) {|memo, value| ... } → object
# reduce(p1 = v1, p2 = v2)
s = [ "cat", " ", "dog" ].inject("", :concat)
p s #=> "cat dog"
s = [ "cat", " ", "dog" ].inject("The result is:", :+)
p s #=> "The result is: cat dog"

product = [ 2, 3, 4 ].inject(1) do |result, next_value|
  result * next_value
end
p product #=> 24

class Turtle

  def initialize
    @x = @y = 0
  end

  def move(dir)
    case dir
    when "n" then @y += 1
    when "s" then @y -= 1
    when "e" then @x += 1
    when "w" then @x -= 1
    end
    self
  end
end

position = "nnneesw".chars.reduce(Turtle.new, :move)
p position  #=>> #<Turtle:0x00000001052f4698 @y=2, @x=1>

product = [ 2, 3, 4 ].inject(:*)
p product # => 24
s = [ "cat", " ", "dog" ].inject(:+)
p s #=> "cat dog"
nested = {foo: 0, bar: 1}.inject([], :push)
p nested # => [[:foo, 0], [:bar, 1]]

# lazy → lazy_enumerator
def pythagorean_triples
  (1..Float::INFINITY).lazy.flat_map {|z|
    (1..z).flat_map {|x|
      (x..z).select {|y|
        x**2 + y**2 == z**2
      }.map {|y|
        [x, y, z]
      }
    }
  }
end
# show first ten pythagorean triples
p pythagorean_triples.take(10).force # take is lazy, so force is needed
p pythagorean_triples.first(10)      # first is eager
# show pythagorean triples less than 100
p pythagorean_triples.take_while { |*, z| z < 100 }.force

# map {|element| ... } → array
# map → enumerator
p (0..4).map {|i| i*i }                               # => [0, 1, 4, 9, 16]
p ({foo: 0, bar: 1, baz: 2}.map {|key, value| value*2}) # => [0, 2, 4]

# max → element
# max(n) → array
# max {|a, b| ... } → element
# max(n) {|a, b| ... } → array
p (1..4).max                   # => 4
p (-4..-1).max                 # => -1
p %w[d c b a].max              # => "d"
p ({foo: 0, bar: 1, baz: 2}.max) # => [:foo, 0]
p [].max                       # => nil
p (1..4).max(2)                   # => [4, 3]
p (-4..-1).max(2)                # => [-1, -2]
p %w[d c b a].max(2)              # => ["d", "c"]
p ({foo: 0, bar: 1, baz: 2}.max(2)) # => [[:foo, 0], [:baz, 2]]
p [].max(2)                       # => []
p %w[xxx x xxxx xx].max {|a, b| a.size <=> b.size } # => "xxxx"
h = {foo: 0, bar: 1, baz: 2}
p h.max {|pair1, pair2| pair1[1] <=> pair2[1] }     # => [:baz, 2]
p [].max {|a, b| a <=> b }                          # => nil
p %w[xxx x xxxx xx].max(2) {|a, b| a.size <=> b.size } # => ["xxxx", "xxx"]
h = {foo: 0, bar: 1, baz: 2}
p h.max(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
# => [[:baz, 2], [:bar, 1]]
p [].max(2) {|a, b| a <=> b }                          # => []

# max_by {|element| ... } → elementclick to toggle source
# max_by(n) {|element| ... } → array
# max_by → enumerator
# max_by(n) → enumerator
p (1..4).max_by {|element| -element }                    # => 1
p %w[a b c d].max_by {|element| -element.ord }           # => "a"
p ({foo: 0, bar: 1, baz: 2}.max_by {|key, value| -value }) # => [:foo, 0]
p [].max_by {|element| -element }                        # => nil
p (1..4).max_by(2) {|element| -element }
# => [1, 2]
p %w[a b c d].max_by(2) {|element| -element.ord }
# => ["a", "b"]
p ({foo: 0, bar: 1, baz: 2}.max_by(2) {|key, value| -value })
# => [[:foo, 0], [:bar, 1]]
p [].max_by(2) {|element| -element }
# => []

# min → element
# min(n) → array
# min {|a, b| ... } → element
# min(n) {|a, b| ... } → array
p (1..4).min                   # => 1
p (-4..-1).min                 # => -4
p %w[d c b a].min              # => "a"
p ({foo: 0, bar: 1, baz: 2}.min) # => [:bar, 1]
p [].min                       # => nil
p (1..4).min(2)                   # => [1, 2]
p (-4..-1).min(2)                 # => [-4, -3]
p %w[d c b a].min(2)              # => ["a", "b"]
p ({foo: 0, bar: 1, baz: 2}.min(2)) # => [[:bar, 1], [:baz, 2]]
p [].min(2)                       # => []
p %w[xxx x xxxx xx].min {|a, b| a.size <=> b.size } # => "x"
h = {foo: 0, bar: 1, baz: 2}
p h.min {|pair1, pair2| pair1[1] <=> pair2[1] } # => [:foo, 0]
p [].min {|a, b| a <=> b }                          # => nil
p %w[xxx x xxxx xx].min(2) {|a, b| a.size <=> b.size } # => ["x", "xx"]
h = {foo: 0, bar: 1, baz: 2}
p h.min(2) {|pair1, pair2| pair1[1] <=> pair2[1] }
# => [[:foo, 0], [:bar, 1]]
p [].min(2) {|a, b| a <=> b }                          # => []

# min_by {|element| ... } → element
# min_by(n) {|element| ... } → array
# min_by → enumerator
# min_by(n) → enumerator
p (1..4).min_by {|element| -element }                    # => 4
p %w[a b c d].min_by {|element| -element.ord }           # => "d"
p ({foo: 0, bar: 1, baz: 2}.min_by {|key, value| -value }) # => [:baz, 2]
p [].min_by {|element| -element }                        # => nil
p (1..4).min_by(2) {|element| -element }
# => [4, 3]
p %w[a b c d].min_by(2) {|element| -element.ord }
# => ["d", "c"]
p ({foo: 0, bar: 1, baz: 2}.min_by(2) {|key, value| -value })
# => [[:baz, 2], [:bar, 1]]
p [].min_by(2) {|element| -element }
# => []

# minmax → [minimum, maximum]
# minmax {|a, b| ... } → [minimum, maximum]
p (1..4).minmax                   # => [1, 4]
p (-4..-1).minmax                 # => [-4, -1]
p %w[d c b a].minmax              # => ["a", "d"]
p ({foo: 0, bar: 1, baz: 2}.minmax) # => [[:bar, 1], [:foo, 0]]
p [].minmax                       # => [nil, nil]
p %w[xxx x xxxx xx].minmax {|a, b| a.size <=> b.size } # => ["x", "xxxx"]
h = {foo: 0, bar: 1, baz: 2}
p h.minmax {|pair1, pair2| pair1[1] <=> pair2[1] }
# => [[:foo, 0], [:baz, 2]]
p [].minmax {|a, b| a <=> b }                          # => [nil, nil]

# minmax_by {|element| ... } → [minimum, maximum]
# minmax_by → enumerator
p (1..4).minmax_by {|element| -element }
# => [4, 1]
p %w[a b c d].minmax_by {|element| -element.ord }
# => ["d", "a"]
p ({foo: 0, bar: 1, baz: 2}.minmax_by {|key, value| -value })
# => [[:baz, 2], [:foo, 0]]
p [].minmax_by {|element| -element }
# => [nil, nil]

# none? → true or false
# none?(pattern) → true or false
# none? {|element| ... } → true or false
p (1..4).none?           # => false
p [nil, false].none?     # => true
p ({foo: 0}.none?)         # => false
p ({foo: 0, bar: 1}.none?) # => false
p [].none?               # => true
p [nil, false, 1.1].none?(Integer)      # => true
p %w[bar baz bat bam].none?(/m/)        # => false
p %w[bar baz bat bam].none?(/foo/)      # => true
p %w[bar baz bat bam].none?('ba')       # => true
p ({foo: 0, bar: 1, baz: 2}.none?(Hash))  # => true
p ({foo: 0}.none?(Array))                 # => false
p [].none?(Integer)                     # => true
p (1..4).none? {|element| element < 1 }                     # => true
p (1..4).none? {|element| element < 2 }                     # => false
p ({foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 0 })  # => true
p ({foo: 0, bar: 1, baz: 2}.none? {|key, value| value < 1 }) # => false

# one? → true or false
# one?(pattern) → true or false
# one? {|element| ... } → true or false
p (1..1).one?           # => true
p [1, nil, false].one?  # => true
p (1..4).one?           # => false
p ({foo: 0}.one?)         # => true
p ({foo: 0, bar: 1}.one?) # => false
p [].one?               # => false
p [nil, false, 0].one?(Integer)        # => true
p [nil, false, 0].one?(Numeric)        # => true
p [nil, false, 0].one?(Float)          # => false
p %w[bar baz bat bam].one?(/m/)        # => true
p %w[bar baz bat bam].one?(/foo/)      # => false
p %w[bar baz bat bam].one?('ba')       # => false
p ({foo: 0, bar: 1, baz: 2}.one?(Array)) # => false
p ({foo: 0}.one?(Array))                 # => true
p [].one?(Integer)                     # => false
p (1..4).one? {|element| element < 2 }                     # => true
p (1..4).one? {|element| element < 1 }                     # => false
p ({foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 1 })  # => true
p ({foo: 0, bar: 1, baz: 2}.one? {|key, value| value < 2 }) # => false

# partition {|element| ... } → [true_array, false_array]
# partition → enumerator
p = (1..4).partition {|i| i.even? }
p p # => [[2, 4], [1, 3]]
p = ('a'..'d').partition {|c| c < 'c' }
p p # => [["a", "b"], ["c", "d"]]
h = {foo: 0, bar: 1, baz: 2, bat: 3}
p = h.partition {|key, value| key.start_with?('b') }
p p # => [[[:bar, 1], [:baz, 2], [:bat, 3]], [[:foo, 0]]]
p = h.partition {|key, value| value < 2 }
p p # => [[[:foo, 0], [:bar, 1]], [[:baz, 2], [:bat, 3]]]

# reject {|element| ... } → array
# reject → enumerator
p (0..9).reject {|i| i * 2 if i.even? }                             # => [1, 3, 5, 7, 9]
p ({foo: 0, bar: 1, baz: 2}.reject {|key, value| key if value.odd? }) # => {:foo=>0, :baz=>2}

# reverse_each(*args) {|element| ... } → self
# reverse_each(*args) → enumerator
a = []
(1..4).reverse_each {|element| a.push(-element) } # => 1..4
p a # => [-4, -3, -2, -1]

a = []
%w[a b c d].reverse_each {|element| a.push(element) }
# => ["a", "b", "c", "d"]
p a # => ["d", "c", "b", "a"]

a = []
h.reverse_each {|element| a.push(element) }
# => {:foo=>0, :bar=>1, :baz=>2}
p a # => [[:baz, 2], [:bar, 1], [:foo, 0]]

# slice_after(pattern) → an_enumerator
# slice_after { |elt| bool } → an_enumerator
lines = ["foo\n", "bar\\\n", "baz\n", "\n", "qux\n"]
e = lines.slice_after(/(?<!\\)\n\z/)
p e.to_a
#=> [["foo\n"], ["bar\\\n", "baz\n"], ["\n"], ["qux\n"]]
p e.map {|ll| ll[0...-1].map {|l| l.sub(/\\\n\z/, "") }.join + ll.last }
#=>["foo\n", "barbaz\n", "\n", "qux\n"]

# slice_before(pattern) → enumerator
# slice_before {|elt| ... } → enumerator
a = %w[foo bar fop for baz fob fog bam foy]
e = a.slice_before(/ba/) # => #<Enumerator: ...>
p e.each {|array| p array }

e = (1..20).slice_before {|i| i % 4 == 2 } # => #<Enumerator: ...>
e.each {|array| p array }

# slice_when {|elt_before, elt_after| bool } → an_enumerator
a = [1,2,4,9,10,11,12,15,16,19,20,21]
b = a.slice_when {|i, j| i+1 != j }
p b.to_a #=> [[1, 2], [4], [9, 10, 11, 12], [15, 16], [19, 20, 21]]
c = b.map {|a| a.length < 3 ? a : "#{a.first}-#{a.last}" }
p c #=> [[1, 2], [4], "9-12", [15, 16], "19-21"]
d = c.join(",")
p d #=> "1,2,4,9-12,15,16,19-21"
a = [3, 11, 14, 25, 28, 29, 29, 41, 55, 57]
p a.slice_when {|i, j| 6 < j - i }.to_a
#=> [[3], [11, 14], [25, 28, 29, 29], [41], [55, 57]]
a = [0, 9, 2, 2, 3, 2, 7, 5, 9, 5]
p a.slice_when {|i, j| i > j }.to_a
#=> [[0, 9], [2, 2, 3], [2, 7], [5, 9], [5]]
a = [7, 5, 9, 2, 0, 7, 9, 4, 2, 0]
p a.slice_when {|i, j| i.even? != j.even? }.to_a
#=> [[7, 5, 9], [2, 0], [7, 9], [4, 2, 0]]
lines = ["foo\n", "bar\n", "\n", "baz\n", "qux\n"]
p lines.slice_when {|l1, l2| /\A\s*\z/ =~ l1 && /\S/ =~ l2 }.to_a
#=> [["foo\n", "bar\n", "\n"], ["baz\n", "qux\n"]]

# sort → array
# sort {|a, b| ... } → array
p (['b', 'c', 'a', 'd'].sort)              # => ["a", "b", "c", "d"]
p ({foo: 0, bar: 1, baz: 2}.sort) # => [[:bar, 1], [:baz, 2], [:foo, 0]]
a = %w[b c a d]
p a.sort {|a, b| b <=> a } # => ["d", "c", "b", "a"]
h = {foo: 0, bar: 1, baz: 2}
p h.sort {|a, b| b <=> a } # => [[:foo, 0], [:baz, 2], [:bar, 1]]

# sort_by {|element| ... } → array
# sort_by → enumerator
a = %w[xx xxx x xxxx]
p a.sort_by {|s| s.size }        # => ["x", "xx", "xxx", "xxxx"]
p a.sort_by {|s| -s.size }       # => ["xxxx", "xxx", "xx", "x"]
h = {foo: 2, bar: 1, baz: 0}
p h.sort_by{|key, value| value } # => [[:baz, 0], [:bar, 1], [:foo, 2]]
p h.sort_by{|key, value| key }   # => [[:bar, 1], [:baz, 0], [:foo, 2]]

# require 'benchmark'

# a = (1..100000).map { rand(100000) }

# Benchmark.bm(10) do |b|
#   b.report("Sort")    { a.sort }
#   b.report("Sort by") { a.sort_by { |a| a } }
# end

# sum(initial_value = 0) → number
# sum(initial_value = 0) {|element| ... } → object
p (1..100).sum          # => 5050
p (1..100).sum(1)       # => 5051
p ('a'..'d').sum('foo') # => "fooabcd"
p 100 * (100 + 1) / 2 # => 5050
p (1..4).sum {|i| i*i }                        # => 30
p (1..4).sum(100) {|i| i*i }                   # => 130
h = {a: 0, b: 1, c: 2, d: 3, e: 4, f: 5}
p h.sum {|key, value| value.odd? ? value : 0 } # => 9
p ('a'..'f').sum('x') {|c| c < 'd' ? c : '' }  # => "xabc"

# take(n) → array
r = (1..4)
p r.take(2) # => [1, 2]
p r.take(0) # => []

h = {foo: 0, bar: 1, baz: 2, bat: 3}
p h.take(2) # => [[:foo, 0], [:bar, 1]]

# take_while {|element| ... } → array
# take_while → enumerator
(1..4).take_while{|i| i < 3 } # => [1, 2]
h = {foo: 0, bar: 1, baz: 2}
p h.take_while{|element| key, value = *element; value < 2 }
# => [[:foo, 0], [:bar, 1]]

# tally(hash = {}) → hash
p (%w[a b c b c a c b].tally) # => {"a"=>2, "b"=>3, "c"=>3}
h = {}                   # => {}
p (%w[a c d b c a].tally(h)) # => {"a"=>2, "c"=>2, "d"=>1, "b"=>1}
p (%w[b a z].tally(h))       # => {"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}
p (%w[b a m].tally(h))       # => {"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=>1}
h = {}                   # => {}
p (%w[a c d b c a].tally(h)) # => {"a"=>2, "c"=>2, "d"=>1, "b"=>1}
p (%w[b a z].tally(h))       # => {"a"=>3, "c"=>2, "d"=>1, "b"=>2, "z"=>1}
p (%w[b a m].tally(h) )      # => {"a"=>4, "c"=>2, "d"=>1, "b"=>3, "z"=>1, "m"=>1}
h = {}                        # => {}
p ({foo: 'a', bar: 'b'}.tally(h)) # => {[:foo, "a"]=>1, [:bar, "b"]=>1}
p ({foo: 'c', bar: 'd'}.tally(h)) # => {[:foo, "a"]=>1, [:bar, "b"]=>1, [:foo, "c"]=>1, [:bar, "d"]=>1}
p ({foo: 'a', bar: 'b'}.tally(h)) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>1, [:bar, "d"]=>1}
p ({foo: 'c', bar: 'd'}.tally(h)) # => {[:foo, "a"]=>2, [:bar, "b"]=>2, [:foo, "c"]=>2, [:bar, "d"]=>2}

# to_h(*args) → hash
# to_h(*args) {|element| ... } → hash
p ([[:foo, 0], [:bar, 1], [:baz, 2]].to_h) # => {:foo=>0, :bar=>1, :baz=>2}
p (0..3).to_h {|i| [i, i ** 2]} # => {0=>0, 1=>1, 2=>4, 3=>9}

# to_set(klass = Set, *args, &block)

# uniq → array
# uniq {|element| ... } → array
p (%w[a b c c b a a b c].uniq)       # => ["a", "b", "c"]
p ([0, 1, 2, 2, 1, 0, 0, 1, 2].uniq) # => [0, 1, 2]
a = [0, 1, 2, 3, 4, 5, 5, 4, 3, 2, 1]
p (a.uniq {|i| i.even? ? i : 0 }) # => [0, 2, 4]
a = %w[a b c d e e d c b a a b c d e]
p (a.uniq {|c| c < 'c' })         # => ["a", "c"]

# zip(*other_enums) → array
# zip(*other_enums) {|array| ... } → nil
a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2, :b3]
c = [:c0, :c1, :c2, :c3]
d = a.zip(b, c)
p d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

f = {foo: 0, bar: 1, baz: 2}
g = {goo: 3, gar: 4, gaz: 5}
h = {hoo: 6, har: 7, haz: 8}
d = f.zip(g, h)
p d # => [
  #      [[:foo, 0], [:goo, 3], [:hoo, 6]],
  #      [[:bar, 1], [:gar, 4], [:har, 7]],
  #      [[:baz, 2], [:gaz, 5], [:haz, 8]]
  #    ]a = [:a0, :a1, :a2, :a3]
b = [:b0, :b1, :b2, :b3]
c = [:c0, :c1, :c2, :c3]
d = a.zip(b, c)
p d # => [[:a0, :b0, :c0], [:a1, :b1, :c1], [:a2, :b2, :c2], [:a3, :b3, :c3]]

f = {foo: 0, bar: 1, baz: 2}
g = {goo: 3, gar: 4, gaz: 5}
h = {hoo: 6, har: 7, haz: 8}
d = f.zip(g, h)
p d # => [
  #      [[:foo, 0], [:goo, 3], [:hoo, 6]],
  #      [[:bar, 1], [:gar, 4], [:har, 7]],
  #      [[:baz, 2], [:gaz, 5], [:haz, 8]]
  #    ]

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
a.zip(b, c) {|sub_array| p sub_array} # => nil