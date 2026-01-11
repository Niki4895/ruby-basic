# ruby -a script.rb data.txt 

# $; = ","
while gets
  $F = $_.split
  puts "Name: #{$F[1]}, Marks: #{$F[2]}"
end

puts "This goes to normal output ($stdout)"
$stderr.puts "This goes to error output ($stderr)"

# Redirect $stderr to a file
$stderr = File.open("error_log.txt", "w")

# This will go to the file, not console
$stderr.puts "An error occurred!"

# Normal output still goes to console
puts "This is normal output"

# Close the file when done
$stderr.close

p "------------------------/n"

p "EXAMPLE of $stdin starts"

puts "Enter your name:"
name = $stdin.gets.chomp   # Read input from standard input
puts "Hello, #{name}!"


# Redirect $stdin to read from a file
$stdin = File.open("f1.txt", "r")

name = $stdin.gets.chomp
puts "Hello, #{name}!"

$stdin.close
p "EXAMPLE of $stdin ends"


p "EXAMPLE of $stdout starts"
$stdout.puts "This goes to the standard output (console)"
puts "This also goes to $stdout by default"

$stdout = File.open("output.txt", "w")

$stdout.puts "This will go into the file instead of console"
puts "This also goes to the file!"

# Close the file when done
$stdout.close