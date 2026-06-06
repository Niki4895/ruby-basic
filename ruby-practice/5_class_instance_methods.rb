# check class_object.rb
module CommonModule
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

p CommonModule::DynamicConst  # => "value"
p CommonModule::Foo          # => NameError

# Object comparision
# obj !~ other → true or false
# obj <=> other → -1, 0, 1 or nil. -1 means self is smaller than other. 0 means self is equal to other. 1 means self is bigger than other. Nil means the two values could not be compared
	# # obj <=> other → 0 or nil # string comparision
	# # obj <=> other  -> 1, -1, number comparision
# obj === other → true or false


# define_singleton_method
class A
end
A.define_singleton_method(:who_am_i) do
	"I am: #{self}"
end
p A.who_am_i
A.define_singleton_method(:hello) { 'Hello There'}
p A.hello

chris = "Chris"
chris.define_singleton_method(:greet) {|greeting| "#{greeting}, I'm Chris!" }
p chris.greet("Hi") #=> "Hi, I'm Chris!"

p"============================"
1.display
"cat".display
[ 4, 5, 6 ].display

class Klass
  attr_accessor :foo
	def foo
		"Foo"
	end
end

s1 = Klass.new
p s1.foo
s2 = s1.clone
p s2.foo
s3 = s1.dup
p s3.foo

a = [1, 2, 3]
p a.to_enum

e = [1, 2, 3].enum_for(:each)
p e.next

a = [1, 2, 3, 4, 5, 6].to_enum
p a.next
p a.first
p a.first(2)
p a.size

# ==, ===, eql?, equal?,
# ==, == -> check equality irrespective of object
# eql? -> check object class and hash key
# equal? -> check Object identity #Are these the exact same object?

#freeze -> unable to update variable
#frozen? -> check variable is freezed
# hash -> value of hash key
# inspect -> human readable object details
# instance_of -> check if instance if of defined class
# instance_variable_defined? -> check if instance variable is defined for that object
# instance_variable_get -> get value of any instance_variable
# instance_variable_set -> set instance variable value
# instance_variables -> list of instance variable list

#is_a?, kind_of? -> check if it instance belongs to passed class
# itself -> pass object ddetails
# matching_methods -> check if passed method has similar method or not
# method -> set class method copy passed as string or symbol and by calling it call that method
# method_missing -> Handle missing method
# methods -> list of public and class methods associated with instance
# A singleton method in Ruby is a method defined for one specific object, not for all instances of its class.
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
# singletone_methods -> list of singletone_methods

# nil? -> check returned value is nil?
# _id_, object_id -> return location for object
# private_methods -> list of private methods
# public_methods -> list of public methods
# protected_methods -> list of protected methods
# public_send(:public_class_method) -> call public_class_method from class which is public method

# remove_instance_variable -> remove instance variable passed as string or symbol
# respond_to? -> check passed method present in class. can passed as string or symbol
# respond_to_missing? -> handle missing method which is passed as string or symbol
# send, _send_ -> call public, private, protected methods
# shortest_abbreviation -> check methods by short name
# to_s -> convert in string

# instance_eval -> call instance variable or method, permorm on passed obj
# instance_exec -> execute block based on passed number or argument

# singleton_method_added -> add singletome method
# singleton_method_removed -> remove singletone method
# singleton_method_undefined -> undefine singletone method
