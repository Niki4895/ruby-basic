# Making the parent Vehicle class
class Vehicle

  def self.inherited(car_type)
    puts "#{car_type} is a kind of Vehicle"
  end

end

# Target class
class Hyundai < Vehicle #Inhereting the Vehicle class
end