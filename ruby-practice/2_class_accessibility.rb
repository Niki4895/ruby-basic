# Ruby subclasses inherit both private and protected methods

class User
    def initialize(name)
        @name = name
    end

    # public methods
    def print_details
        p "Name #{@name}"
    end

    def check_protected(other_user)
        p @name == other_user.check_name
    end

    def check_private(other_user)
        p @name == other_user.check_private_name
    end

    def method_missing
        p "method missing"
    end


    protected
    
    def protected_details
        p "Protected Method #{@name}"
    end

    def check_name
        @name
    end

    private

    def private_details
        p "Private Details #{@name}"
    end

    def check_private_name
        @@name
    end
end

class Profile < User
    def print_details
        p "Called Profile class method"
        super # call parent class methods
    end

    def user_details
        protected_details
    end

    def user_private_details
        private_details
    end
end
u1 = User.new('Niki')
u1.check_protected(User.new('Niki'))
# u1.check_private(User.new('Niki')) # private method `check_private_name' called for #<User
u1.print_details
Profile.new('Niki').user_details
Profile.new('Niks').user_private_details
Profile.new('Nikita shah').print_details
# Profile.new('Niki').protected_details # protected method `protected_details' called for #<Profile:
# u1.protected_details # protected method `protected_details' called for USER


user = User.new('Nikita')
# public method calling
user.print_details
user.print_details()
user.public_send(:print_details)

# Private method calling ways
user.send(:private_details)
user.method(:private_details).call
user.method(:private_details).()
user.method(:private_details).[]
user.tap(&:private_details)
u_method = user.method(:private_details)
user.instance_variable_set(:@name, "Not only Code")
u_method.call()
u_method.call
:private_details.to_proc.call(user)
p "================="
# require 'method_source'
# user.instance_eval("private_details")
# method_source = user.method(:private_details).source
# method_body = method_source.split("\n")[1...-1].join(';')
# user.instance_eval(method_source)


class User2
  def initialize
    @data = {
      name: "Not only Code",
      email: "user@example.com"
    }
  end

  def method_missing(method_name, *args)
    if @data.key?(method_name)
      @data[method_name]
    else
      "No method #{method_name} found"
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    @data.key?(method_name) || super
  end
end

user2 = User2.new

puts user2.name   # => Not only Code
puts user2.email  # => user@example.com
puts user2.test_method
puts user.respond_to?(:test_method_missing)

class User3
  class << self
    def method_missing(method_name, *args)
      if method_name.to_s.start_with?("find_by_")
        field = method_name.to_s.sub("find_by_", "")
        puts "Finding user by #{field}"
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      method_name.to_s.start_with?("find_by_") || super
    end
  end
end

User3.find_by_email("test@example.com") # => Finding user by email
p User3.respond_to_missing?('find_by_email')
p User3.respond_to_missing?('find_email')

class Vehicle
    def initialize(name)
        p "Parent Class"
        @name = name
    end
end

class Car < Vehicle
    def initialize(name, model)
        super(name) # Deraived class Example
        @model = model
    end

    def display_details
        p "Name: #{@name}, model: #{@model}"
    end
end

class Bus < Vehicle
    def initialize(name, model)
        @name = name
        @model = model
    end

    def display_details
        p "Name: #{@name}, model: #{@model}"
    end
end

Car.new('Hyundai', 'Aura').display_details
Bus.new('TATA', 'Punch').display_details