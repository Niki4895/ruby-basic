#!/usr/bin/env ruby

$global_variable = 10
class TestData
  @@no_of_customers = 0
  # constructure method with undefined number of argument
  def initialize(*a)
    @args = a
    @@no_of_customers += 1
    $global_variable += 10
  end

  # methods finds length of passed arguments
  def len
    p @args.length
  end

=begin
  Ruby multi line comments only work when there is no whitespace between the start of the line and the =begin (the same applies to the =end). Make sure the line starts with =begin:
=end
  def boolean_data
    if true
      puts "It is True!"
    else
      puts "It is False!"
    end
    
    if nil
      puts "nil is True!"
    else
      puts "nil is False!"
    end
    
    if 0
      puts "0 is True!"
    else
      puts "0 is False!"
    end
  end

  def variable_type
    # local variable
    age = 10 
    _Age = 20

    p age
    p _Age
    
    # instance Variable # accessible here
    p @args

    # Class Variable accessible in different object
    p @@no_of_customers

    # Global Variable
    puts "Global variable in Class2 is #$global_variable"
  end
end

TestData.new('a', 'b').len # check length of manually passed arguments
TestData.new(ARGV).len # check length of passed args arguments
TestData.new.boolean_data
TestData.new(1,2,3).variable_type