# ruby predefined_constant.rb data.txt Alice 25 Developer

puts "All command-line arguments: #{$*}"
puts "First argument: #{$*[0]}"
puts "Second argument: #{$*[1]}"
puts "Third argument: #{$*[2]}"
puts "Fourth argument: #{$*[3]}"


p "The name of current input file reads from $<. Same as $<.filename."
p $FILENAME