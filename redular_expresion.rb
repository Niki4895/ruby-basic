if "hi there".match(/hi/)
  puts "match"
end

# declaring a function which checks for vowel in a string
def contains_vowel(str)
  str =~ /[aeiou]/
end

puts( contains_vowel("Food") )
puts( contains_vowel("bcd") )


a="2m3"
b="2.5"
# The dot character . matches all but does not match new line. If you want to search . character, then you have to escape it.
# . literal matches for all character
if(a.match(/\d.\d/))
  puts("match found")
else
  puts("not found")
end
# after escaping it, it matches with only '.' literal
if(a.match(/\d\.\d/))
  puts("match found")
else
  puts("not found")
end
 
if(b.match(/\d.\d/))
  puts("match found")
else
  puts("not found")
end

p ("test123@.".match(/\w/)) ? 'Matched' : 'Not Matched' #matched as it contains characters and numbers
p ("123@qw".match(/\d/)) ? 'Matched' : 'Not Matched' #matched as it contains numbers
p ("123@qw".match(/\s/)) ? 'Matched' : 'Not Matched' #not matched as it doesn't contain white space
p ("123 qw".match(/\s/)) ? 'Matched' : 'Not Matched' #matched as it contain white space
p "--------------------------"
p ("12".match(/\W/)) ? 'Matched' : 'Not Matched' #not matched as it contains characters or numbers
p ("@.".match(/\W/)) ? 'Matched' : 'Not Matched' #matched as it contains other than [0-9A-Za-z_]
p ("qw".match(/\D/)) ? 'Matched' : 'Not Matched' #matched as it doesn't contains numbers
p ("123@qw".match(/\S/)) ? 'Matched' : 'Not Matched' #matched as it doesn't  contain white space

p "--------------------------"
p ("b".match(/a+/)) ? 'Matched' : 'Not Matched' #not matched as doesn't have any number
p ("a".match(/a+/)) ? 'Matched' : 'Not Matched' #matched as it contain 1 number
p ("b".match(/a*/)) ? 'Matched' : 'Not Matched' #matched as it incluse 0 or more characters
p ("".match(/a*/)) ? 'Matched' : 'Not Matched' #matched as it incluse 0 or more characters
p "colour".match?(/colou?r/) ? 'Matched' : 'Not Matched' #matched as it incluse 0 or 1 character
p "colouur".match?(/colou?r/) ? 'Matched' : 'Not Matched' #not matched as it doesn't incluse 0 or 1 character
p "aaaa".match?(/a{2,4}/) ? 'Matched' : 'Not Matched' #matched as it appeared in range
p "a".match?(/a{2,4}/) ? 'Matched' : 'Not Matched' # not matched as it doen't appear in range
# i → Ignore case
puts "Hello".match?(/hello/i)  # true

# x → Extended mode (ignore whitespace & allow comments)
pattern = /
  a+      # one or more a
  b       # followed by b
/x
puts "aaab".match?(pattern)  # true

text = "hello\nworld"

# m → Multiline (dot matches newline in Ruby)
puts text.match?(/hello.world/)    # false
puts text.match?(/hello.world/m)   # true

# u, e, s, n → Encoding modifiers
puts "こんにちは".match?(/こんにちは/u)  # UTF-8 mode

text = "Hello\nWorld"

pattern = /
  ^hello   # start with hello
  .+       # one or more characters
/xmi

puts text.match?(pattern)  # true
