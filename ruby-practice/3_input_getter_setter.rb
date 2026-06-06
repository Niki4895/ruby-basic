class User
    def initialize(name)
        @name = name
    end

    def name
       p @name
    end

    def name=(name)
        @name = name
    end
end
puts "Enter name"
u_name = gets
user = User.new(u_name)
user.name
p "Enter Updated Name"
u_name2 = gets.chomp
user.name=(u_name2)
user.name

class User
    def initialize(name, age)
        @name = name
        @age = age
    end

    attr_reader :name, :age

    def name=(name)
        @name = name
    end
end
print "Enter Age"
age = gets.chomp.to_i
user = User.new("Nikita", age)
p user.name
p user.age

class User
    def initialize(name)
        @name = name
    end

    attr_writer :name
    attr_reader :name
end
pp "Enter User name"
u = $stdin.gets.chomp
user = User.new(u)
p user.name

class User
    def initialize(name)
        @name = name
    end

    attr_accessor :name
end
user = User.new("Niki")
p user.name
