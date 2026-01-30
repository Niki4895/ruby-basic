# As Ruby Does not allow multiple inheritance to avoid diamond problem we use mixin(include, extend modules) 

class Vehicle
    def type
        p "Type of vehicle is #{self.class.name}"
    end
end


class Car < Vehicle
    def display_name
        p "Display method inside child class"
    end
end

class Bus < Vehicle
    def type # Example of method Overriding 
        super
        p "Child class Vehicle type: #{self.class.name}"
    end
end

car = Car.new
car.type
car.display_name
Bus.new.type
