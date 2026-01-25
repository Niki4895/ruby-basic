#  ruby predefined_variable.rb f1.txt f2.txt  

# Ruby program to illustrate  
# use of raise statement


p "NAME OF SCRIPT -----"
p $0
p "The process number of the current Ruby program being executed. Alias of $PROCESS_ID."
p $$
p "The status of the last child process terminated. Alias of $CHILD_STATUS."
p $?
p "Load paths for programs and binary module by load or required. Alias of $LOAD_PATH"
p $:

# $= = true # deprecated after 1.9

puts "hello" == "HELLO"   # true if $= is true
puts "Hello" == "world"   # false
p "Array contains the module name loaded by require.Alias of $LOAD_FEATURES."
p $"
p "------------------------/n"
begin
         
  puts 'This is Before Exception Arise!'
         
  # using raise to create an exception   
   
  raise 'Exception Created!'
   
  puts 'After Exception' 
rescue 
  puts "EXAMPLE for $! and $@ ------"
  puts $!
  puts $@ # error raised line number
  puts "EXAMPLE END for $! and $@ ------"
end

puts "==================="
puts "EXAMPLE for $:"
a = [1, 2, 3]
p a.join() #"123"

a ="1 2 3"
p a.split($;)


puts " Update $; as ;"
$; = ';' 
a = '1;2;3'
p a.split($;)
puts "EXAMPLE END for $:"

puts "----------------------"
p "EXAMPLE for $<"

if !ARGV[0].nil? || !ARGV[1].nil?
   file = File.open(ARGV[0], 'w+')
   file.syswrite('Hello Test')
   file.close

   file2 = File.open(ARGV[1], 'w+')
   file2.syswrite('Hello Test awsdas')
   file2.close

  # a, n = *$< is a compact way to assign the first two elements 
  # from the ARGF stream (represented by $<) to variables.
  p *$< # read files from args
end
p "EXAMPLE end for $<"


p "*********************"
p "EXAMPLE for $>"
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

p "EXAMPLE for $&"
text = "Her name is Jane name"
text =~ /name/

puts $&      # => "name"
p "EXAMPLE for $`"
puts $`      # => "Her "
p "EXAMPLE for $'"
puts $'

p "EXAMPLE for $1-$9 && $+"
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
p "************************"
p "EXAMPLE start for $_ Enter any string"
gets
p "here it prints input string"
p $_
p "EXAMPLE ENDS for $_"


p "EXAMPLE for $. starts -- ENTER 2 strings it includes args as well"
a = gets
p $. # total number of input till here
p "EXAMPLE for $. ends"



p "\n\n\n EXAMPLE starts for $/ and $\\"
# The default behavior of gets (stops at each newline)
puts "--- Default behavior (enter to end input) ---"
print "Enter some text: "
str_default = gets
puts "Read: #{str_default.inspect}" # inspect shows the actual newline

# Changing the input record separator to a double newline (\n\n)
# Now you must hit Enter twice to finish input
puts "\n--- Modified behavior (double enter to end input) ---"
$/ = "\n\n"
print "Enter multiple lines: "
str_modified = gets

puts "Read: #{str_modified.inspect}"

# Resetting the separator to default for potential future code
$/ = "\n"

$\ = "\n"

puts "test #{$\}test 2"

p "EXAMPLE ends for $\\ and $/"


p "EXAMPLE FOR $-p"
# execute command line
# echo "hello\nworld" | ruby -p -e '$_ = $_.upcase if $-p'
p "EXAMPLE FOR $-l"
# echo -e "hello\nworld" | ruby -l -p demo_l.rb

p "EXAMPLE for $-i "
# Original file
# echo -e "cat\ndog\ncat" > animals.txt
# Uppercase all lines, editing animals.txt in place and saving a backup as animals.txt.bak
# ruby -pi.bak -e '$_ = $_.upcase' animals.txt

# "it will find test in f2.txt and update test with test 123 with bak file with actual text"
# ruby -i.bak -pe 'gsub(/Test/, "TEST 123")' f2.txt

p "EXAMPLE for $-d --> CALL for ruby -d predefined_variable.rb f1.txt f2.txt"
puts "Debug mode enabled? #{$-d}"

if $-d
  puts "Running in debug mode"
else
  puts "Running in normal mode"
end


p "EXAMPLE for $-v --> CALL for ruby -v predefined_variable.rb f1.txt f2.txt"
puts "Verbose mode enabled? #{$-v}"

if $-v
  puts "Running in verbose mode"
else
  puts "Running in normal mode"
end


p "EXAMPLE for $-K --> CALL for ruby -Ku predefined_variable.rb f1.txt f2.txt"
puts "Encoding set by -K: #{$-K}"

case $-K
when "u"
  puts "UTF-8 encoding"
when "s"
  puts "Shift_JIS encoding"
when "e"
  puts "EUC encoding"
when "n"
  puts "Native / locale encoding"
when "w"
  puts "Windows-specific encoding"
when "ascii"
  puts "ASCII encoding"
else
  puts "Other / unknown encoding"
end

puts "$-K value (read-only, may be deprecated): #{$-K}"
puts "Default external encoding: #{Encoding.default_external}"
puts "Default internal encoding: #{Encoding.default_internal}"
puts "Script file encoding: #{__ENCODING__}"


