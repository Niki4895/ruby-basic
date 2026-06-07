$global_variable = 10 #global varible
class TestData
  @@no_of_customers = 0 # class variable
  def initialize(*a)
    # a is local variable
    @args = a #instance variable
    @@no_of_customers += 1
    $global_variable += 10
  end

  attr_reader :args

  # methods finds length of passed arguments
  def len
    p @args.length
  end
  
  def class_variable
    @@no_of_customers
  end
end

p $global_variable # 10
a = TestData.new(1)
a.len # 1
p a.class_variable # 1
p a.args # [1]
p $global_variable # 20

b = TestData.new(2)
b.len # 1
p b.class_variable # 2
p b.args # [2]
p $global_variable # 30

# operators
# +, -, /, *
# %, **, ==, !=, >, <, >=, <=, <=>, &&, ||, !, +=, -=, /=, *=
# &, |, ^, ~, >>, <<, defined?
# ., ::
# operator overloading
class Car
    attr_accessor :name, :color
 
    # Initialize the name and color
    def initialize(name, color)
        @name = name
        @color = color
    end
    def +(obj)
        p self # a
        p obj # b
        return Car.new("#{self.name}#{obj.name}", 
                  "#{self.color}#{obj.color}")
    end
end
a = Car.new("Mercedes", "Red")
b = Car.new("Audi", "Silver")
puts (a+b).inspect