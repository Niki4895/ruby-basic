p "============PUBLIC CLASS METHOD================="

module MyModule
   def self.const_missing(name)
    case name
    when :DynamicConst
      const_set(name, "value")  # Defines and returns it
    else
      raise NameError, "Unresolved constant #{name}"
    end
    rescue => e
        "ERROR #{e}" 
  end
end

p MyModule::DynamicConst  # => "value"
p MyModule::Foo          # => NameError

p "==============Public Instance Methods ========="
class MyClass
    def initialize
        p "MyClass"
    end
end

class MyClass2
    def initialize
        p "MyClass2"
    end
end

m1 = MyClass.new
m2 = MyClass2.new
# obj !~ other → true or false
p m1 != m2 # true
p m1 != m1 # false

# obj <=> other → 0 or nil
# Returns 0 if obj and other are the same object or obj == other, otherwise nil.
# The #<=> is used by various methods to compare objects, for example Enumerable#sort, Enumerable#max etc.
# Your implementation of #<=> should return one of the following values: -1, 0, 1 or nil. -1 means self is smaller than other. 0 means self is equal to other. 1 means self is bigger than other. Nil means the two values could not be compared
# When you define #<=>, you can include Comparable to gain the methods #<=, #<, #==, #>=, #> and between?.
p m1 <=> m2 # nil
p m1 <=> m1 # 0
class Person
  include Comparable
  attr_reader :age
  
  def initialize(age)
    @age = age
  end
  
  def <=>(other)
    age <=> other.age  # Delegates to Integer's <=> [web:16]
  end
end

p1 = Person.new(30)
p2 = Person.new(25)
puts p1 <=> p2  # 1 (30 > 25)
puts p2 <=> p1  # -1 (25 < 30) [web:15]

# obj === other → true or false
# Case Equality – For class Object, effectively the same as calling #==, but typically overridden by descendants to provide meaningful semantics in case statements.

p MyClass === MyClass.new     # => true
p MyClass === "string"        # => false
p MyClass === 42              # => false [web:23]

# obj =~ other → nil # deprecated

# define_singleton_method(symbol, method) → symbol
# define_singleton_method(symbol) { block } → symbol
# Defines a singleton method in the receiver. The method parameter can be a Proc, a Method or an UnboundMethod object. If a block is specified, it is used as the method body. If a block or a method has parameters, they're used as method parameters.
class A
  class << self
    def class_name
      to_s
    end
  end
end
A.define_singleton_method(:who_am_i) do
  "I am: #{class_name}"
end
A.who_am_i   # ==> "I am: A"

guy = "Bob"
guy.define_singleton_method(:hello) { "#{self}: Hello there!" }
p guy.hello    #=>  "Bob: Hello there!"

chris = "Chris"
chris.define_singleton_method(:greet) {|greeting| "#{greeting}, I'm Chris!" }
p chris.greet("Hi") #=> "Hi, I'm Chris!"

# display(port=$>) → nil
# def display(port=$>)
#   port.write self
#   nil
# end

1.display
"cat".display
[ 4, 5, 6 ].display
puts

# 1cat[4, 5, 6]

# dup → an_object
# Produces a shallow copy of obj—the instance variables of obj are copied, but not the objects they reference.
class Klass
  attr_accessor :str
end

module Foo
  def foo; 'foo'; end
end

s1 = Klass.new #=> #<Klass:0x401b3a38>
s1.extend(Foo) #=> #<Klass:0x401b3a38>
p s1.foo #=> "foo"

s2 = s1.clone #=> #<Klass:0x401be280>
p s2.foo #=> "foo"

s3 = s1.dup #=> #<Klass:0x401c1084>
# p s3.foo #=> NoMethodError: undefined method `foo' for #<Klass:0x401c1084>

# enum_for(method = :each, *args) → enum
# enum_for(method = :each, *args){|*args| block} → enum
# to_enum(method = :each, *args) → enum
# to_enum(method = :each, *args) {|*args| block} → enum
str = "xyz"

enum = str.enum_for(:each_byte)
enum.each { |b| puts b }
# => 120
# => 121
# => 122

# protect an array from being modified by some_method
a = [1, 2, 3]
p a.to_enum

# String#split in block form is more memory-effective:
# very_large_string.split("|") { |chunk| return chunk if chunk.include?('DATE') }
# This could be rewritten more idiomatically with to_enum:
# very_large_string.to_enum(:split, "|").lazy.grep(/DATE/).first

module Enumerable
  # a generic method to repeat the values of any enumerable
  def repeat(n)
    raise ArgumentError, "#{n} is negative!" if n < 0
    unless block_given?
      return to_enum(__method__, n) do # __method__ is :repeat here
        sz = size     # Call size and multiply by n...
        sz * n if sz  # but return nil if size itself is nil
      end
    end
    each do |*val|
      n.times { yield *val }
    end
  end
end

%i[hello world].repeat(2) { |w| puts w }
  # => Prints 'hello', 'hello', 'world', 'world'
enum = (1..14).repeat(3)
  # => returns an Enumerator when called without a block
p enum.first(4) # => [1, 1, 1, 2]
p enum.size # => 42

# obj == other → true or false
# equal?(other) → true or false
# eql?(other) → true or false
# Equality — At the Object level, #== returns true only if obj and other are the same object. Typically, this method is overridden in descendant classes to provide class-specific meaning.
# Unlike #==, the equal? method should never be overridden by subclasses as it is used to determine object identity (that is, a.equal?(b) if and only if a is the same object as b):
obj = "a"
other = obj.dup

p obj == other      #=> true
p obj.equal? other  #=> false
p obj.equal? obj    #=> true
# The eql? method returns true if obj and other refer to the same hash key. This is used by Hash to test members for equality. For any pair of objects where eql? returns true, the hash value of both objects must be equal. So any subclass that overrides eql? should also override hash appropriately.
p 1 == 1.0     #=> true
p 1.eql? 1.0   #=> false

# extend(module, ...) → obj
# Adds to obj the instance methods from each module given as a parameter.
module Mod
  def hello
    "Hello from Mod.\n"
  end
end

class Klass
  def hello
    "Hello from Klass.\n"
  end
end

k = Klass.new
p k.hello         #=> "Hello from Klass.\n"
p k.extend(Mod)   #=> #<Klass:0x401b3bc8>
p k.hello         #=> "Hello from Mod.\n"

# freeze → obj
# Prevents further modifications to obj. A FrozenError will be raised if modification is attempted. There is no way to unfreeze a frozen object. See also Object#frozen?.
a = [ "a", "b", "c" ]
a.freeze
p a.frozen?
# a << "z" # can't modify frozen Array: ["a", "b", "c"] (FrozenError)

# hash → integer
{}.hash                # => 0
{a: 1}.hash            # => 930169293566868326
{name: "Bob"}.hash     # => -602000848360846651

# Same content = same hash
h1 = {x: 1, y: 2}
h2 = {y: 2, x: 1}      # Order doesn't matter
p h1.hash == h2.hash     # => true

# inspect → string
# Returns a string containing a human-readable representation of obj. The default inspect shows the object's class name, an encoding of its memory address, and a list of the instance variables and their values (by calling inspect on each of them). 
p [ 1, 2, 3..4, 'five' ].inspect   #=> "[1, 2, 3..4, \"five\"]"
p Time.new.inspect                 #=> "2008-03-08 19:43:39 +0900"

class Book
end
p Book.new.inspect                  #=> "#<Foo:0x0300c868>"

class Bar
  def initialize
    @bar = 1
  end
end
p Bar.new.inspect                  #=> "#<Bar:0x0300c868 @bar=1>"

# instance_of?(class) → true or false
class A;     end
class B < A; end
class C < B; end

b = B.new
b.instance_of? A   #=> false
b.instance_of? B   #=> true
b.instance_of? C   #=> false

# instance_variable_defined?(symbol) → true or false
# instance_variable_defined?(string) → true or false
class Fred
  def initialize(p1, p2)
    @a, @b = p1, p2
  end
end
fred = Fred.new('cat', 99)
p fred.instance_variable_defined?(:@a)    #=> true
p fred.instance_variable_defined?("@b")   #=> true
p fred.instance_variable_defined?("@c")   #=> false

# instance_variable_get(symbol) → obj
# instance_variable_get(string) → obj
class Fred
  def initialize(p1, p2)
    @a, @b = p1, p2
  end
end
fred = Fred.new('cat', 99)
p fred.instance_variable_get(:@a)    #=> "cat"
p fred.instance_variable_get("@b")   #=> 99

# instance_variable_set(symbol, obj) → obj
# instance_variable_set(string, obj) → obj
class Fred
  def initialize(p1, p2)
    @a, @b = p1, p2
  end
end
fred = Fred.new('cat', 99)
p fred.instance_variable_set(:@a, 'dog')   #=> "dog"
p fred.instance_variable_set(:@c, 'cat')   #=> "cat"
p fred.inspect                             #=> "#<Fred:0x401b3da8 @a=\"dog\", @b=99, @c=\"cat\">"

# instance_variables → array
class Fred
  attr_accessor :a1
  def initialize
    @iv = 3
  end
end
p Fred.new.instance_variables   #=> [:@iv]

# is_a?(class) → true or false
# kind_of?(class) → true or false
module M;    end
class A
  include M
end
class B < A; end
class C < B; end

b = B.new
p b.is_a? A          #=> true
p b.is_a? B          #=> true
p b.is_a? C          #=> false
p b.is_a? M          #=> true

p b.kind_of? A       #=> true
p b.kind_of? B       #=> true
p b.kind_of? C       #=> false
p b.kind_of? M       #=> true

# itself → obj
string = "my string"
p string.itself.object_id == string.object_id   #=> true

# matching_methods(s = '', m = callable_methods)
class Object
  def callable_methods
    # Get all public instance methods (callable)
    public_methods(false)
  end
  
  def matching_methods(s = '', m = callable_methods)
    m.select { |meth| meth.to_s.match?(/#{Regexp.escape(s)}/i) }
  end
end

class Person1
  def full_name; end
  def calculate_age; end
  def email; end
end

person = Person1.new

# Find methods matching "name"
p person.matching_methods('name')  
# => [:full_name]

# Case-insensitive partial match
p person.matching_methods('age')   
# => [:calculate_age]

# All methods (empty string)
p person.matching_methods          # => [:full_name, :calculate_age, :email]

# method(sym) → method
class Demo
  def initialize(n)
    @iv = n
  end
  def hello()
    "Hello, @iv = #{@iv}"
  end
end

k = Demo.new(99)
m = k.method(:hello)
p m.call   #=> "Hello, @iv = 99"

l = Demo.new('Fred')
m = l.method("hello")
p m.call   #=> "Hello, @iv = Fred"

[ 1, 2, 3 ].each(&method(:puts)) # => prints 3 lines to stdout
out = File.open('test.txt', 'w')
[ 1, 2, 3 ].each(&out.method(:puts)) # => prints 3 lines to file

require 'date'
p %w[2017-03-01 2017-03-02].collect(&Date.method(:parse))
#=> [#<Date: 2017-03-01 ((2457814j,0s,0n),+0s,2299161j)>, #<Date: 2017-03-02 ((2457815j,0s,0n),+0s,2299161j)>]

# method_missing(m, *a, &b)
class Dynamic
  def method_missing(m, *a, &b)
    puts "Missing method: #{m}"
    puts "Args: #{a.inspect}"
    b.call if b  # Yield block if given
  end
end

obj = Dynamic.new
obj.unknown_method(1, 2, 3) { "block" }

# methods(regular=true) → array
class Klass
  def klass_method()
  end
end
k = Klass.new
k.methods[0..9]    #=> [:klass_method, :nil?, :===,
                   #    :==~, :!, :eql?
                   #    :hash, :<=>, :class, :singleton_class]
k.methods.length   #=> 56

k.methods(false)   #=> []
def k.singleton_method; end
k.methods(false)   #=> [:singleton_method]

module M123; def m123; end end
k.extend M123
k.methods(false)   #=> [:singleton_method]

# nil? → true or false
p Object.new.nil?   #=> false
p nil.nil?          #=> true

# __id__ → integer
# object_id → integer

p Object.new.object_id  == Object.new.object_id  # => false
p (21 * 2).object_id    == (21 * 2).object_id    # => true
p "hello".object_id     == "hello".object_id     # => false
p "hi".freeze.object_id == "hi".freeze.object_id # => true

class X
    def public_class_method
        p "public method"
    end

    protected
    def protected_class_method
        p "Protected methods"
    end

    private

    def private_class_method
        p "Private Method"
    end
end

# private_methods(all=true) → array
p X.new.private_methods

# protected_methods(all=true) → array
p X.new.protected_methods

# public_method(sym) → method
p X.new.public_method(:public_class_method) # #<Method: X#public_class_method() class_object.rb:416>

# public_methods(all=true) → array
p X.new.public_methods

# public_send(symbol [, args...]) → obj
# public_send(string [, args...]) → obj
# 1.public_send(:puts, "hello")  # causes NoMethodError
X.new.public_send(:public_class_method)

# remove_instance_variable(symbol) → obj
# remove_instance_variable(string) → obj
class Dummy
  attr_reader :var
  def initialize
    @var = 99
  end
  def remove
    remove_instance_variable(:@var)
  end
end
d = Dummy.new
p d.var      #=> 99
p d.remove   #=> 99
p d.var      #=> nil

# respond_to?(symbol, include_all=false) → true or false
# respond_to?(string, include_all=false) → true or false

person = X.new

p person.respond_to?(:public_class_method)      # => true
p person.respond_to?(:private_class_method)     # => false  
p person.respond_to?(:private_class_method, true) # => true

# String works too
p person.respond_to?("public_class_method")     # => true
p person.respond_to?("private_class_method")    # => false

# respond_to_missing?(symbol, include_all) → true or false
# respond_to_missing?(string, include_all) → true or false
class Dynamic
  def method_missing(m, *a, &b)
    if m =~ /^get_(.+)/
      instance_variable_get("@#{$1}")
    else
      super
    end
  end
  
  def respond_to_missing?(m, include_all=false)
    m.to_s.start_with?('get_') || super  # Handle dynamic methods
  end
end

obj = Dynamic.new
obj.instance_variable_set(:@name, "Alice")

p obj.respond_to?(:get_name)       # => true (via respond_to_missing?)
p obj.get_name                     # => "Alice" (via method_missing)

p obj.respond_to?(:regular)        # => false

# send(symbol [, args...]) → obj
# __send__(symbol [, args...]) → obj
# send(string [, args...]) → obj
# __send__(string [, args...]) → obj
class Klass
  private
    def hello(*args)
    "Hello " + args.join(' ')
  end
end
k = Klass.new
p k.send :hello, "gentle", "readers"   #=> "Hello gentle readers"

# shortest_abbreviation(s = '', m = callable_methods)
class Person2
  def callable_methods
    public_methods(false)
  end
  
  def matching_methods(s = '', m = callable_methods)
    m.select { |meth| meth.to_s.match?(/#{Regexp.escape(s)}/i) }
  end
  
  def shortest_abbreviation(s = '', m = callable_methods)
    matches = matching_methods(s, m)
    return [] if matches.empty?
    
    shortest = matches.map(&:to_s).min_by(&:length)
    
    # Verify it's unique
    matches.count { |meth| meth.to_s.start_with?(shortest) } == 1 ? [shortest.to_sym] : []
  end
end

person = Person2.new
def person.full_name; end
def person.calculate_age; end

p person.shortest_abbreviation('name')  # => [:full_name] or shortest prefix
p person.shortest_abbreviation('age')  # => [:calculate_age] or shortest prefix

# singleton_class → class
# Returns the singleton class of obj. This method creates a new singleton class if obj does not have one.
p Object.new.singleton_class  #=> #<Class:#<Object:0xb7ce1e24>>
p String.singleton_class      #=> #<Class:String>
p nil.singleton_class         #=> NilClass

# singleton_method(sym) → method
class Demo
  def initialize(n)
    @iv = n
  end
  def hello()
    "Hello, @iv = #{@iv}"
  end
end

k = Demo.new(99)
def k.hi
  "Hi, @iv = #{@iv}"
end
m = k.singleton_method(:hi)
p m.call   #=> "Hi, @iv = 99"
# m = k.singleton_method(:hello) #=> NameError

# singleton_methods(all=true) → array
module Other
  def three() end
end

class Single
  def Single.four() end
end

a = Single.new

def a.one()
end

class << a
  include Other
  def two()
  end
end

p Single.singleton_methods    #=> [:four]
p a.singleton_methods(false)  #=> [:two, :one]
p a.singleton_methods         #=> [:two, :one, :three]

=begin
Deprecated methods
taint → obj
tainted? → false
trust → obj
untrust → obj
untaint → obj
untrusted? → false
=end

# to_s → string
p :text.to_s # text

p "==============Private Instance Methods================="

# do_until()
# class InteractiveShell
#   def do_until(&condition)
#     yield until condition.call
#   end
# end

# shell = InteractiveShell.new
# i = 0
# shell.do_until { i > 5 } { i += 1 }

# do_while()
# def do_while
#   yield while yield
# end

# i = 0
# do_while { i < 5 } { i += 1 }
# puts i  # => 5
# f(m = 100)
def f(m = 100)
  m.times { yield }
end

f(3) { puts "hi" }  # Prints "hi" 3 times

# h(a = 'H', b = 'w', c = '!')
# def h(a = 'H', b = 'w', c = '!')
#   display "#{a}ello #{b}orld#{c}"
# end

# p h          # => "Hello world!"
# p h('Hi')    # => "Hiello world!"

# instance_eval(string [, filename [, lineno]] ) → obj
# instance_eval {|obj| block } → obj
class KlassWithSecret
  def initialize
    @secret = 99
  end
  private
  def the_secret
    "Ssssh! The secret is #{@secret}."
  end
end
k = KlassWithSecret.new
p k.instance_eval { @secret }          #=> 99
p k.instance_eval { the_secret }       #=> "Ssssh! The secret is 99."
p k.instance_eval {|obj| obj == self } #=> true


# instance_exec(arg...) {|var...| block } → obj
class KlassWithSecret
  def initialize
    @secret = 99
  end
end
k = KlassWithSecret.new
p k.instance_exec(5) {|x| @secret+x }   #=> 104

# singleton_method_added(symbol)
module Chatty
  def Chatty.singleton_method_added(id)
    puts "Adding #{id.id2name}"
  end
  def self.one()     end
  def two()          end
  def Chatty.three() end
end

# singleton_method_removed(symbol)
module Chatty
  def Chatty.singleton_method_removed(id)
    puts "Removing #{id.id2name}"
  end
  def self.one()     end
  def two()          end
  def Chatty.three() end
  class << self
    remove_method :three
    remove_method :one
  end
end

# singleton_method_undefined(symbol)
module Chatty
  def Chatty.singleton_method_undefined(id)
    puts "Undefining #{id.id2name}"
  end
  def Chatty.one()   end
  class << self
     undef_method(:one)
  end
end