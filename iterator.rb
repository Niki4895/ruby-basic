# each
(0..9).each do |i|
  # statement to be executed
  puts i
end
p "-------------------------"

#collect
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
b = a.collect{ |y| (5 * y) }
puts b
p "-------------------------"

#times
7.times do |i|
  puts i
end
p "-------------------------"

#Upto Iterator
4.upto(7) do |n|   
  puts n
end

# no input
7.upto(4) do |n|   
  puts n
end
p "-------------------------"

#Downto
7.downto(4) do |n|   
  puts n
end

# so no output
4.downto(7) do |n|   
  puts n   
end
p "-------------------------"

#Step Iterator
(0..60).step(10) do|i|
  puts i
end
p "-------------------------"

#each_line
"Welcome\nto\nGeeksForGeeks\nPortal".each_line do|i|
  puts i
end
p "-------------------------"
