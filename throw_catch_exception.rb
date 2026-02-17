# Ruby program to illustrate 
# use of catch and throw statement

# defining a  method
def catch_and_throw(value)

  puts value
  a = readline.chomp

  # using throw statement
  throw :value_e if a == "!"
  return a
end

# using catch statement
catch :value_e do
  # enter number
  number = catch_and_throw("Enter Number: ")
  p number
end


# Ruby Program of Catch and Throw Exception
gfg = catch(:divide) do
  # a code block of catch similar to begin
  number = rand(2)

  throw :divide if number == 0

  number # set gfg = number if
  # no exception is thrown
end
puts gfg

# Ruby Program of Catch and Throw Exception
gfg = catch(:divide) do
  # a code block of catch similar to begin
  number = rand(2)

  throw :divide, 10 if number == 0

  number # set gfg = number if
  # no exception is thrown
end
puts gfg
