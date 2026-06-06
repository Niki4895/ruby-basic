# Ruby Class
class User
    # Inside class everything is object
    # Constructure
    def initialize(name)
        @name = name
    end

    # method
    def print_details
        p "User name is #{@name}"
    end
end

# Instance
u1 = User.new('Nikita')
u1.print_details

# Ruby Class
class User2
    def initialize(name:)
        @name = name
    end

    def print_details
        p "User name is #{@name}"
    end
end

# u2 = User2.new('Nikita') # gives error wrong number of arguments (given 1, expected 0; required keyword: name) (ArgumentError)
u2 = User2.new(name: 'Nikita')
u2.print_details

# Class in Class
class Vehicle
    class Car
        def initialize(c_name)
            @c_name = c_name
        end

        def print_details
            p "Company Name is #{@c_name}"
        end
    end
end

v1 = Vehicle::Car.new('Hyndai')
v1.print_details

# class method
class Profile
    def self.user_name(name)
        p "User Name is #{name}"
    end
end
p Profile.user_name('Nikita')

module UserDetail
    class User
        # Create User class and get arguments
        class << self
            def call(*args, **kwargs)
                # p **kwargs # handle name: 'Nikita', age: 24
                # p *args # Handle 'Nikita', 24
                # Call actual Method
                new(*args, **kwargs).call
            end
        end

        # directly read attribute
        attr_reader :name, :age, :called, :errors, :result
        
        def initialize(name: , age: )
            @name = name
            @age = age
            @errors = {}
        end

        def call
            # Prevent Duplicate method calling
            return self if @called

            @result = do_call
            @called = true

            self
        end

        def success?
            called && errors.empty?
        end

        def error_message
            # p errors # {:age=>"Age can't be blank"}
            errors.values.join('; ')
        end

        # accessibility
        private

        def do_call
            if age.nil?
                errors.store(:age, "Age can't be blank")
            else
                puts "Name: #{name} and Age: #{age}"
            end
        end
    end

    class User2
        def initialize(name:, age:)
            @name = name
            @age = age
        end

        def print_details
            p "User name is #{@name} and age is #{@age}"
        end
    end
end

ud1 = UserDetail::User.call(name: 'Nikita', age: 24 )
p ud1.success?
ud2 = UserDetail::User.call(name: 'Nikita', age: nil)
p ud2.success?
p ud2.name
p ud2.error_message
# UserDetail::User.call('Nikita', 24) # we didn't handle this in contructor

ud3 = UserDetail::User2.new(name: 'Niki', age: 24)
ud3.print_details
ud4 = UserDetail::User2.new(age: 24, name: 'Niks')
ud4.print_details