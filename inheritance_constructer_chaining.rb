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