# A block is the same thing as a method, but it does not belong to an object. Blocks are called closures in other programming languages. There are some important points about Blocks in Ruby:

# Block can accept arguments and returns a value.
# Block does not have their own name.
# Block consist of chunks of code.
# A block is always invoked with a function or can say passed to a method call.
# To call a block within a method with a value, yield statement is used.
# Blocks can be called just like methods from inside the method that it is passed to.

# Ruby program to demonstrate the block
# defined inside do..end statements

# here 'each' is the method name 
# or block name 
# n is the variable
["Geeks", "GFG", 55].each do |n|   
 puts n   
end

# Ruby program to demonstrate the block
# Inline between the curly braces {}

# here 'each' is the method name 
# n is the variable
["Geeks", "GFG", 55].each {|i| puts i}

# Ruby program to demonstrate the 
# arguments passing to block

# here india_states is an array and 
# it is the argument which is to 
# be passed to block 
india_states = ["Andhra Pradesh", "Assam", "Bihar", "Chhattisgarh", 
                "Goa", "Gujarat", "Haryana", "Arunachal Pradesh",
                "Karnataka", "Manipur", "Punjab", "Uttar Pradesh", 
                "Uttarakhand"] 
 
# passing argument to block
india_states.each do |india_states|
 puts india_states
end

# Ruby program to demonstrate how block returns the values

# here two methods called i.e 'select' and 'even?'
# even? method is called inside the block
puts [1, 2, 3, 4, 5].select { |num| num.even? }


# Ruby program to demonstrate the yield statement

# method
def shivi
    
  # statement of the method to be executed
  puts "Inside Method!"
  
  # using yield statement
  yield
    
  # statement of the method to be executed 
  puts "Again Inside Method!"
  
  # using yield statement
  yield
  
end

# block
shivi{puts "Inside Block!"}


# Ruby program to demonstrate the yield statement

# method
def shivi
    
  # statement of the method to be executed
  puts "Inside Method!"

  # using yield statement
  # p1 is the parameter
  yield "p1"

  # statement of the method to be executed
  puts "Again Inside Method!"
  
  # using yield statement
  # p2 is the parameter
  yield "p2"
end

# block
shivi{ |para| puts "Inside Block #{para}"}

# Ruby program to demonstrate the BEGIN and END block

# BEGIN block
BEGIN { 
    
   # BEGIN block code 
   puts "This is BEGIN block Code"
} 

# END block 
END { 
    
   # END block code 
   puts "This is END block code"
}

# Code will execute before END block 
puts "Before END block"

# Ruby program to demonstrate the use of 
# same variable outside and inside a block

# variable 'x' outside the block 
x = "Outside the block"

# here x is inside the block
4.times do |x|    
  puts "Value Inside the block: #{x}"    
end    

puts "Value Outside the block: #{x}"