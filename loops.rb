#while loop
x = 4
while x > 0
  print x
  x -= 1
end
p "=================="

x = 5
y = 0
while y < x
  print y
  y += 1
end
p "=================="

# for loop
for a in 1..5 do
  print a
end
p "=================="

arr = ['a', 'b', 'c', 'd']
for a in arr do
  print a
end
p "=================="

# do..while Loop
# do while loop is similar to while loop with the only difference that it checks the condition after executing the statements,
i = 1
loop do
  p "Hello #{i}"
  break if i == 3
  i += 1
end
p "=================="

loop do
  puts "Do you want to do that again?"
  answer = gets.chomp
  if answer != 'Y'
    break
  end
end
p "=================="

begin
  puts "Do you want to do that again?"
  answer = gets.chomp
end while answer == 'Y'
p "=================="

# until Loop
# Ruby until loop will executes the statements or code till the given condition evaluates to true.
i = 7
until i <= 0 do
  p "Hello #{i}"
  i -= 1
end
p "=================="

# Each method
names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
names.each { |name| puts name }
p "=================="

# recursion
def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end
doubler(2)
p "=================="


# Other loops
(1..5).each do |a|
  p a
end
p "=================="

(1..5).to_a.reverse.each do |a|
  p a
end
p "=================="

3.times do
  p  "Hello"
end
p "=================="

3.times do |i|
  p  "Hello #{i + 1}"
end
p "=================="

1.upto(5) do |i|
  puts i
end
p "=================="

5.downto(1) do |i|
  puts i
end
p "=================="

1.step(10,2) { |i| puts i }
p "=================="

5.times.with_index(100){|i, idx| p i, idx}
p "=================="

p (0...10).select(&:even?)