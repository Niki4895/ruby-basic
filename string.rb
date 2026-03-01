# \& and \0 correspond to $&, which contains the complete matched text.
# \' corresponds to $', which contains the string after the match.
# \` corresponds to $`, which contains the string before the match.
# \+ corresponds to $+, which contains the last capture group.

s = 'hello'
p s.sub(/[aeiou]/, '*') # => "h*llo"
p s.gsub(/[aeiou]/, '*') # => "h*ll*"
p s.gsub(/[aeiou]/, '')  # => "hll"
p s.sub(/ell/, 'al')     # => "halo"
p s.gsub(/xyzzy/, '*')   # => "hello"
p 'THX1138'.gsub(/\d+/, '00') # => "THX00"
p 'THXd+1138'.gsub("\d+", '00') # => "THX001138"
p 'THX1138'.gsub("\\d+", '00') # => "THX1138"

h = {'foo' => 'bar', 'baz' => 'bat'}
p 'food'.sub!('foo', h) # => "bard"
p 'bazzar'.sub('baz', h) # => "batzar"

h = {foo: 'bar', baz: 'bat'}
p 'food'.sub!('foo', h) # => 'd'
p 'bazzar'.sub('baz', h) # => 'zar'

s = '@'
p '1234'.gsub(/\d/) { |match| s.succ! } # => "ABCD"
# s.succ! mutates s to its "successor":
# '@'.succ! → 'A' (ASCII 64→65)
# 'A'.succ! → 'B'
# 'B'.succ! → 'C'
# 'C'.succ! → 'D'

# String replacement may contain back-references to the pattern’s captures:
# \n (n is a non-negative integer) refers to $n.
# \k<name> refers to the named capture name.

str = "2026-02-25"
result = str.gsub(/(?<year>\d{4})-(?<month>\d{2})-(?<day>\d{2})/, "\\k<year>/\\k<month>/\\k<day>")
puts result  # => "2026/02/25"

str = "hello world"
result = str.gsub(/hello/, "hi \\& there")
puts result  # => "hi hello there world"

str = "apple=123 orange=456"
result = str.gsub(/(\w+)=(\d+)/, "\\1:\\2")  # or "\\\\1:\\\\2" in double quotes
puts result  # => "apple:123 orange:456"


p "-------------------WHITESPACE IN STRING---------------------"
# NL (null): "\x00", "\u0000".
# HT (horizontal tab): "\x09", "\t".
# LF (line feed): "\x0a", "\n".
# VT (vertical tab): "\x0b", "\v".
# FF (form feed): "\x0c", "\f".
# CR (carriage return): "\x0d", "\r".
# SP (space): "\x20", " ".

a = " Test lstrip"
p a.lstrip
p a
p a.lstrip!
p a

p "------------------------------------"
a = "Test rstrip "
p a.rstrip
p a
p a.rstrip!
p a

p "-------------------------------------"
a = " Test strip "
p a.strip
p a
p a.strip!
p a

p "-------------------Slices---------------------"
# string[index]
str = "hello"
p str[1]      # => "e" (2nd char)
p str[-2]     # => "l" (2nd from end)
p str[99]     # => nil (out of bounds)

# string[start, length]
p 'foo'[0, 2] # => 0th index 2 characters -> fo
p 'foo'[1, 200] #=> oo
p 'food'[-2, 2] #=> 'last 2nd index 2 chars'
p 'foo'[-2, -1] #=> negative length nil

# string[range]
p 'foo'[0..1] # fo
p 'foo'[0, 2] # fo
p 'foo'[1..200] # oo
p 'foo'[4..5] # nil out of range
p 'foo'[-4..-3] # nil
p 'food'[-2..-1] # od
p 'foo'[-2..197] # oo
p 'foo'[-3..197] # foo

# string[regexp, capture = 0]
p 'foo'[/o/] # o
p 'foo'[/x/] # nil
s = 'hello there'
p s[/[aeiou](.)\l/]        # => "ell"
p s[/[aeiou](.)\l/, 0]     # => "ell"
# If the argument capture is provided and not 0, it should be either a capture group index (integer) or a capture group name (String or Symbol); the slice is the specified capture (see Groups at Regexp and Captures):
s = 'hello there'
p s[/[aeiou](.)\l/, 1] # => "l"
p s[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, "non_vowel"] # => "l"
p s[/(?<vowel>[aeiou])(?<non_vowel>[^aeiou])/, :vowel]      # => "e"

# string[substring]
p 'foo'['oo'] => 'oo'
p 'foo'['xx'] => nil


# new(string = '', **opts) → new_string
s = String.new
s # => ""
p s.encoding # => #<Encoding:ASCII-8BIT>
a = String.new('Test')
p a.valid_encoding? # => true
s = String.new('こんにちは', encoding: 'ascii')
p s.valid_encoding? # => false
p String.new('foo', encoding: Encoding::US_ASCII).encoding # => #<Encoding:US-ASCII>
p String.new('foo', encoding: 'US-ASCII').encoding         # => #<Encoding:US-ASCII>
p String.new('foo', encoding: 'ASCII').encoding            # => #<Encoding:US-ASCII>

# eturns a copy of string (or an empty string, if string is not given); the given capacity is advisory only, and may or may not set the size of the internal buffer, which may in turn affect performance:
p String.new(capacity: 1)
p String.new('foo', capacity: 4096)
p String.new('hello', encoding: 'UTF-8', capacity: 25)

# try_convert(object) → object, new_string, or nil
p String.try_convert("hello")
class MyStringLike
  def to_str
    "converted!"
  end
end

obj = MyStringLike.new
p String.try_convert(obj)

# Public Instance Methods
# string % object → new_string
p "%05d" % 123 # => "00123"
p "%-5d" % 123 # => "123  "
p "%-5s: %016x" % [ "ID", self.object_id ] # => "ID   : 00002b054ec93168"
p "foo = %{foo}" % {foo: 'bar'} # => "foo = bar"
p "foo = %{foo}, baz = %{baz}" % {foo: 'bar', baz: 'bat'} # => "foo = bar, baz = bat"

# string * integer → new_string
p "Ho! " * 3 # => "Ho! Ho! Ho! "
p "Ho! " * 0 # => ""

# string + other_string → new_string
p "Hello from " + self.to_s # => "Hello from main"

# +string → new_string or self
s1 = "hello"                  # mutable
p +s1                           # => "hello" (self)

s2 = "frozen".freeze          # frozen
p +s2                           # => "frozen" (new mutable copy)

p s1.object_id == (+s1).object_id  # => false (different objects)
p s2.object_id == (+s2).object_id  # => false (different objects)

p "---------------------------------------------"
# -string → frozen_string
s1 = "hello"                  # mutable
p -s1                           # => "hello" (frozen copy)
p (-s1).frozen?                 # => true

s2 = "frozen".freeze          # frozen
p -s2                           # => "frozen" (self)

p s1.object_id == (-s1).object_id  # => false (different objects)
p s2.object_id == (-s2).object_id  # => true

# string << object → string
s = 'foo'
s << 'bar' # => "foobar"
p s          # => "foobar"

s = 'foo'
p s << 33 # => "foo!"
p s << 36 # => 'foo!$'

# string <=> other_string → -1, 0, 1, or nil
p 'foo' <=> 'foo' # => 0
p 'foo' <=> 'food' # => -1
p 'food' <=> 'foo' # => 1
p 'FOO' <=> 'foo' # => -1
p 'foo' <=> 'FOO' # => 1
p 'foo' <=> 1 # => nil

# string == object → true or false
s = 'foo'
p s == 'foo' # => true
p s == 'food' # => false
p s == 'FOO' # => false

# string === object → true or false
s = 'foo'
p s == 'foo' # => true
p s == 'food' # => false
p s == 'FOO' # => false

=begin
== (Equality)
Compares values semantically, calling #== on the receiver. Returns true if objects have equivalent content, regardless of class or identity.

=== (Case Equality)
Used in case statements for pattern matching, calling #=== on the receiver (right side). Often more permissive than ==—e.g., String === "str" or /foo/ === "foo bar".
=end

p "-------------------------------"
# == checks value equality
p "2" == 2          # => false (different classes)
p [1,2] == [1,2]    # => true (same contents)
p Array.new[1,2] == [1,2]    # => true (same contents)

# === for pattern matching (receiver is right side)
case 3
when 1..5         # calls (1..5) === 3
  "in range"
end               # => "in range"

p String === "hi"   # => true (class check)


p "------------------------------------"
# string =~ regexp → integer or nil
# string =~ object → integer or nil

'foo' =~ /f/ # => 0
'foo' =~ /o/ # => 1
'foo' =~ /x/ # => nil

number= nil
"no. 9" =~ /(?<number>\d+)/
p number # => nil (not assigned)
/(?<number>\d+)/ =~ "no. 9"
p number #=> "9"


#string[index] = new_string
# string[start, length] = new_string
# string[range] = new_string
# string[regexp, capture = 0] = new_string
# string[substring] = new_string

s = 'foo'
s[2] = 'rtune'     # => "rtune"
p s                  # => "fortune"
s[1, 5] = 'init'   # => "init"
p s                  # => "finite"
s[3..4] = 'al'     # => "al"
p s                  # => "finale"
s[/e$/] = 'ly'     # => "ly"
p s                  # => "finally"
s['lly'] = 'ncial' # => "ncial"
p s                  # => "financial"

# append_as_bytes(*objects) → string
if RUBY_VERSION.to_i > 3.4
    s = 'foo'
    p s.append_as_bytes(" \xE2\x82")  # => "foo \xE2\x82"
    p s.valid_encoding?               # => false
    s.append_as_bytes("\xAC 12")
    p s.valid_encoding?               # => true
    s = ""
    p s.append_as_bytes(0, 257)        # =>  "\u0000\u0001"
end

# ascii_only? → true or false
p 'abc'.ascii_only?         # => true
p "abc\u{6666}".ascii_only? # => false

# b → string

s = "\x99"
s.encoding   # => #<Encoding:UTF-8>
t = s.b      # => "\x99"
p t.encoding   # => #<Encoding:ASCII-8BIT>
p t.bytes    # => [153]

s = "\u4095" # => "䂕"
p s.encoding   # => #<Encoding:UTF-8>
p s.bytes      # => [228, 130, 149]
t = s.b      # => "\xE4\x82\x95"
p t.encoding   # => #<Encoding:ASCII-8BIT>
p t.bytes      # => [228, 130, 149]

p "=========================================="
# byteindex(substring, offset = 0) → integer or nil
# byteindex(regexp, offset = 0) → integer or nil
p 'foo'.byteindex('f') # => 0
p 'foo'.byteindex('o') # => 1
p 'foo'.byteindex('oo') # => 1
p 'foo'.byteindex('ooo') # => nil
p 'foo'.byteindex(/f/) # => 0
p 'foo'.byteindex(/o/) # => 1
p 'foo'.byteindex(/oo/) # => 1
p 'foo'.byteindex(/ooo/) # => nil
# Offset
p 'foo'.byteindex('o', 1) # => 1
p 'foo'.byteindex('o', 2) # => 2
p 'food'.byteindex('d', 2) # => 2
p 'foo'.byteindex('o', 3) # => nil
p 'foo'.byteindex('o', -1) # => 2
p 'foo'.byteindex('o', -2) # => 1
p 'foo'.byteindex('o', -3) # => 1
p 'foo'.byteindex('o', -4) # => nil

# byterindex(substring, offset = self.bytesize) → integer or nil
# byterindex(regexp, offset = self.bytesize) → integer or nil
p 'foo'.byterindex('f') # => 0
p 'foo'.byterindex('o') # => 2
p 'foo'.byterindex('oo') # => 1
p 'foo'.byterindex('ooo') # => nil
p 'foo'.byterindex(/f/) # => 0
p 'foo'.byterindex(/o/) # => 2
p 'foo'.byterindex(/oo/) # => 1
p 'foo'.byterindex(/ooo/) # => nil
p 'foo'.byterindex(/o+/) # => 2
p $~ #=> #<MatchData "o">
p 'foo'.byterindex(/(?<!o)o+/) # => 1
p $~ #=> #<MatchData "oo">
p 'foo'.byterindex('o', 0) # => nil
p 'foo'.byterindex('o', 1) # => 1
p 'foo'.byterindex('o', 2) # => 2
p 'foo'.byterindex('o', 3) # => 2
p 'foo'.byterindex('o', -1) # => 2
p 'foo'.byterindex('o', -2) # => 1
p 'foo'.byterindex('o', -3) # => nil
p 'foo'.byterindex('o', -4) # => nil

# bytes → array_of_bytes
p 'hello'.bytes # => [104, 101, 108, 108, 111]
p 'тест'.bytes  # => [209, 130, 208, 181, 209, 129, 209, 130]
p 'こんにちは'.bytes # => # => [227, 129, 147, 227, 130, 147, 227, 129, 171, 227, 129, 161, 227, 129, 175]

# bytesize → integer
p 'foo'.bytesize        # => 3
p 'тест'.bytesize       # => 8
p 'こんにちは'.bytesize   # => 15

p " --------------------BYTE SLICE---------------"
# byteslice(index, length = 1) → string or nil
# byteslice(range) → string or nil
s = '0123456789' # => "0123456789"
p s.byteslice(2)   # => "2"
p s.byteslice(200) # => nil
p s.byteslice(4, 3)  # => "456"
p s.byteslice(4, 30) # => "456789"
p s.byteslice(4, -1) # => nil
p s.byteslice(40, 2) # => nil
p s.byteslice(-4)    # => "6"
p s.byteslice(-4, 3) # => "678"
p s.byteslice(4..6)   # => "456"
p s.byteslice(-6..-4) # => "456"
p s.byteslice(5..2)   # => "" # range.size is zero.
p s.byteslice(40..42) # => nil

p "-------------------------BYTE SPLICE----------------------"
# bytesplice(index, length, str) → string
# bytesplice(index, length, str, str_index, str_length) → string
# bytesplice(range, str) → string
# bytesplice(range, str, str_range) → string
if RUBY_VERSION.to_i > 3.4
    s = "hello world"  # 11 bytes
    # Replace bytes 0-4 ("hello") with "hi "
    p s.bytesplice(0, 5, "hi ") # => "hi  world"
    # Replace bytes 6-10 ("world") with "there" (different length)
    p s.bytesplice(4, 10, "there") # => "hi  there"
    # Using ranges
    p s.bytesplice(0..2, "Hello")  # => "Hello there"
    # Partial replacement from source string
    p s.bytesplice(6, 10, "Ruby World", 0, 4) # => "Hello Ruby"
    # Range + source range
    p s.bytesplice(0..1, "ABCDEF", 2..4) # => "BCDEF there"
end

# capitalize(*options) → stringclick
s = 'hello World!' # => "hello World!"
p s.capitalize       # => "Hello world!"
p s
p s.capitalize!      # => "Hello world!"
p s                  # => "Hello world!"
p s.capitalize!      # => nil

# casecmp(other_string) → -1, 0, 1, or nil
p 'foo'.casecmp('foo') # => 0
p 'foo'.casecmp('food') # => -1
p 'food'.casecmp('foo') # => 1
p 'FOO'.casecmp('foo') # => 0
p 'foo'.casecmp('FOO') # => 0
p 'foo'.casecmp(1) # => nil

# casecmp?(other_string) → true, false, or nil
p 'foo'.casecmp?('foo') # => true
p 'foo'.casecmp?('food') # => false
p 'food'.casecmp?('foo') # => false
p 'FOO'.casecmp?('foo') # => true
p 'foo'.casecmp?('FOO') # => true
p 'foo'.casecmp?(1) # => nil

# center(size, pad_string = ' ') → new_string
p 'hello'.center(10)       # => "  hello   "
p '  hello'.center(10)     # => "   hello  "
p 'hello'.center(10, 'ab') # => "abhelloaba"
p 'тест'.center(10)        # => "   тест   "
p 'こんにちは'.center(10)    # => "  こんにちは   "
p 'hello'.center(5)  # => "hello"
p 'hello'.center(1)  # => "hello"

# chars → array_of_characters
p 'hello'.chars     # => ["h", "e", "l", "l", "o"]
p 'тест'.chars      # => ["т", "е", "с", "т"]
p 'こんにちは'.chars # => ["こ", "ん", "に", "ち", "は"]

# chomp(line_sep = $/) → new_string
# chomp!(line_sep = $/) → self or nil
p $/                    # => "\n"
p "abc\r".chomp         # => "abc"
p "abc\n".chomp         # => "abc"
p "abc\r\n".chomp       # => "abc"
p "abc\n\r".chomp       # => "abc\n"
p "тест\r\n".chomp      # => "тест"
p "こんにちは\r\n".chomp  # => "こんにちは"
p "abc\n\n\n".chomp('')           # => "abc"
p "abc\r\n\r\n\r\n".chomp('')     # => "abc"
p "abc\n\n\r\n\r\n\n\n".chomp('') # => "abc"
p "abc\n\r\n\r\n\r".chomp('')     # => "abc\n\r\n\r\n\r"
p "abc\r\r\r".chomp('')           # => "abc\r\r\r"

p 'abcd'.chomp('d')  # => "abc"
p 'abcdd'.chomp('d') # => "abcd"

# chop → new_string
# chop! → self or nil
# Removes "\r\n" if those are the last two characters.
p "abc\r\n".chop      # => "abc"
p "тест\r\n".chop     # => "тест"
p "тест\n\r".chop     # => "тест\n"
p "こんにちは\r\n".chop # => "こんにちは"

# Otherwise removes the last character if it exists.
p 'abcd'.chop     # => "abc"
p 'тест'.chop     # => "тес"
p 'こんにちは'.chop # => "こんにち"
p ''.chop         # => ""

# chr → string # Returns a string containing the first character of self
s = 'foo' # => "foo"
p s.chr     # => "f"

# clear → self # Removes the contents of self:
s = 'foo' # => "foo"
p s.clear   # => ""

# codepoints → array_of_integers # Returns an array of the codepoints in self; each codepoint is the integer value for a character:
p 'hello'.codepoints     # => [104, 101, 108, 108, 111]
p 'тест'.codepoints      # => [1090, 1077, 1089, 1090]
p 'こんにちは'.codepoints # => [12371, 12435, 12395, 12385, 12399]

# concat(*objects) → string
s = 'foo'
p s.concat('bar', 'baz') # => "foobarbaz"
s = 'foo'
p s.concat(32, 'bar', 32, 'baz') # => "foo bar baz"

# count(*selectors) → integer #Returns the total number of characters in self that are specified by the given selectors
a = "hello world"
p a.count "lo"                   #=> 5
p a.count "lo", "o"              #=> 2
p a.count "hello", "^l"          #=> 4
p a.count "ej-m"                 #=> 4

"hello^world".count "\\^aeiou" #=> 4
"hello-world".count "a\\-eo"   #=> 4

c = "hello world\\r\\n"
p c.count "\\"                   #=> 2
p c.count "\\A"                  #=> 0
p c.count "X-\\w"                #=> 3

# crypt(salt_str) → new_string
# Returns the string generated by calling crypt(3) standard library function with str and salt_str, in this order, as its arguments. Please do not use this method any longer. It is legacy; provided only for backward compatibility with ruby scripts in earlier days. It is bad to use in contemporary programs for several reasons:
p "foo".crypt("$5$rounds=1000$salt$") # OK, proper usage
p "foo".crypt("$5$round=1000$salt$")  # Typo not detected
p "foo".crypt("$5$rounds=1000$salt$") # => "$5fNPQMxC5j6."

# -string → frozen_string # Note that -string variant is more convenient for defining constants:
# dedup → frozen_string # while dedup is better suitable for using the method in chains of calculations:
# Returns a frozen, possibly pre-existing copy of the string.
FILENAME = -'config/database.yml'
# @url_list.concat(urls.map(&:dedup))