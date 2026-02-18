require 'pp'
=begin
| Method | Newline? | Best For                | Example Output for "Hi"       |
| ------ | -------- | ----------------------- | ----------------------------- |
| puts   | Yes      | Final output            | Hi                            |
| print  | No       | Side-by-side text       | Hi (cursor after)             |
| p      | Yes      | Debug (shows quotes)    | "Hi"                          |
| pp     | Yes      | Nested data readability | "Hi" (formatted)              |
| printf | Custom   | Precise formatting      | Hi (with specifiers) robrace​ |
=end

puts "Enter number" # added new line and display as Enter Number
data = gets.chomp.to_i # chomp method is a built-in String class method used to remove the record separator like \r\n
printf("Inputted Number %d\n", data) # doesn't add new line 

puts "Enter decimal number" #added new line but display as "Enter Number"
b = gets
print b

puts "Enter string"
c = $stdin.gets.chomp
p c

user = { id: 1, profile: { name: "Delhi Dev", city: "Delhi" } }
pp user
pp('x' * 100)