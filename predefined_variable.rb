# Ruby program to illustrate  
# use of raise statement 
  
begin
         
   puts 'This is Before Exception Arise!'
         
   # using raise to create an exception   
   
   raise 'Exception Created!'
   
   puts 'After Exception' 
rescue 
   puts $!
   puts $@ # error raised line number
end

a = [1, 2, 3]
p a.join() #"123"

a ="1 2 3"
p a.split($;)


$; = ';' 
a = '1;2;3'
p a.split($;)

# a, n = *$< is a compact way to assign the first two elements 
# from the ARGF stream (represented by $<) to variables.
p *$< # read files from args


# By default, this goes to standard output (the terminal)
print "Hello\n"   # uses $>

# Redirect all Kernel.print / printf output to a file
File.open("log.txt", "w") do |f|
  old = $>
  $>  = f

  print "This goes into log.txt\n"  # uses $>, now the file
ensure
  $> = old  # restore original destination
end

text = "Her name is Jane name"
text =~ /name/

puts $&      # => "name"
puts $`      # => "Her "
puts $'      


text = "stacklist"
text =~ /(st)(a)(ck)(li)/

puts $1   # => "st"
puts $2   # => "a"
puts $3   # => "ck"
puts $+   # => "li"

text = "coords: (12, 34, 44)"

text =~ /\((\d+),\s*(\d+),\s*(\d+)\)/

puts $1  # => "12"
puts $2  
puts $3  

gets
p "here it prints input string"
p $_


# execute command line
# echo "hello\nworld" | ruby -p -e '$_ = $_.upcase if $-p'

# echo -e "hello\nworld" | ruby -l -p demo_l.rb

# Original file
# echo -e "cat\ndog\ncat" > animals.txt
# Uppercase all lines, editing animals.txt in place and saving a backup as animals.txt.bak
# ruby -pi.bak -e '$_ = $_.upcase' animals.txt


# a = gets
# b = gets 
p $. # total number of input till here


# # The default behavior of gets (stops at each newline)
# puts "--- Default behavior (enter to end input) ---"
# print "Enter some text: "
# str_default = gets
# puts "Read: #{str_default.inspect}" # inspect shows the actual newline

# # Changing the input record separator to a double newline (\n\n)
# # Now you must hit Enter twice to finish input
# puts "\n--- Modified behavior (double enter to end input) ---"
# $/ = "\n\n"
# print "Enter multiple lines: "
# str_modified = gets

# puts "Read: #{str_modified.inspect}"

# # Resetting the separator to default for potential future code
# $/ = "\n"

# $\ = "\n"

# puts "test #{$\} test 2"
