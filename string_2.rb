# delete(*selectors) → new_string
# delete!(*selectors) → self or nil
p "hello".delete "l","lo"        #=> "heo"
p "hello".delete "lo"            #=> "he"
p "hello".delete "aeiou", "^e"   #=> "hell"
p "hello".delete "ej-m"          #=> "ho"
p "hello".delete "e-j"    # => "lo"     (e,f,g,h,i,j removed)
p "hello".delete "ej-m"   # => "ho"     (- is literal, not range)
p "hello".delete "e-j-m"  # => "lo"     (e-j range + m)

# delete_prefix(prefix) → new_string
# delete_prefix!(prefix) → self or nil
p 'hello'.delete_prefix('hel')      # => "lo"
p 'hello'.delete_prefix('llo')      # => "hello"
p 'тест'.delete_prefix('те')        # => "ст"
p 'こんにちは'.delete_prefix('こん')  # => "にちは"

# delete_suffix(suffix) → new_string
# delete_suffix!(suffix) → self or nil
p 'hello'.delete_suffix('llo')      # => "he"
p 'hello'.delete_suffix('hel')      # => "hello"
p 'тест'.delete_suffix('ст')        # => "те"
p 'こんにちは'.delete_suffix('ちは')  # => "こんに"

# downcase(*options) → string
# downcase!(*options) → self or nil
s = 'Hello World!' # => "Hello World!"
p s.downcase         # => "hello world!"

# dump → string
# Returns a printable version of self, enclosed in double-quotes, with special characters escaped, and with non-printing characters replaced by hexadecimal notation:
p "hello \n ''".dump    # => "\"hello \\n ''\""
p "\f\x00\xff\\\"".dump # => "\"\\f\\x00\\xFF\\\\\\\"\""

# each_byte {|byte| ... } → self
# each_byte → enumerator
'hello'.each_byte {|byte| print byte, ' ' }
print "\n"
'тест'.each_byte {|byte| print byte, ' ' }
print "\n"
'こんにちは'.each_byte {|byte| print byte, ' ' }
print "\n"

# each_char {|c| ... } → self
# each_char → enumerator
'hello'.each_char {|char| print char, ' ' }
print "\n"
'тест'.each_char {|char| print char, ' ' }
print "\n"
'こんにちは'.each_char {|char| print char, ' ' }
print "\n"

# each_codepoint {|integer| ... } → self
# each_codepoint → enumerator
'hello'.each_codepoint {|codepoint| print codepoint, ' ' }
print "\n"
'тест'.each_codepoint {|codepoint| print codepoint, ' ' }
print "\n"
'こんにちは'.each_codepoint {|codepoint| print codepoint, ' ' }
print "\n"

# each_grapheme_cluster {|gc| ... } → self
# each_grapheme_cluster → enumerator
s = "\u0061\u0308-pqr-\u0062\u0308-xyz-\u0063\u0308" # => "ä-pqr-b̈-xyz-c̈"
s.each_grapheme_cluster {|gc| print gc, ' ' }

# each_line(line_sep = $/, chomp: false) {|substring| ... } → self
# each_line(line_sep = $/, chomp: false) → enumerator
# lines(Line_sep = $/, chomp: false) → array_of_strings
s = <<~EOT
This is the first line.
This is line two.

This is line four.
This is line five.
EOT

s.each_line {|line| p line }
p "----------------------"
s.each_line(' is ') {|line| p line }
p "----------------------"
s.each_line(chomp: true) {|line| p line }
p "----------------------"
s.each_line('') {|line| p line }

# empty? → true or false
p "hello".empty? # => false
p " ".empty? # => false
p "".empty? # => true

# encode(dst_encoding = Encoding.default_internal, **enc_opts) → string
# encode(dst_encoding, src_encoding, **enc_opts) → string
# encode!(dst_encoding = Encoding.default_internal, **enc_opts) → self
# encode!(dst_encoding, src_encoding, **enc_opts) → self
Encoding.default_internal # => nil
s = "Ruby\x99".force_encoding('Windows-1252')
p s.encoding                # => #<Encoding:Windows-1252>
p s.bytes                   # => [82, 117, 98, 121, 153]
t = s.encode              # => "Ruby\x99"
p t.encoding                # => #<Encoding:Windows-1252>
p t.bytes                   # => [82, 117, 98, 121, 226, 132, 162]

Encoding.default_internal = 'UTF-8'
t = s.encode              # => "Ruby™"
p t.encoding                # => #<Encoding:UTF-8>
s = "Ruby\x99".force_encoding('Windows-1252')
p s.encoding            # => #<Encoding:Windows-1252>
t = s.encode('UTF-8') # => "Ruby™"
p t.encoding            # => #<Encoding:UTF-8>

# end_with?(*strings) → true or false
p 'hello'.end_with?('ello')               #=> true
p 'hello'.end_with?('heaven', 'ello')     #=> true
p 'hello'.end_with?('heaven', 'paradise') #=> false
p 'тест'.end_with?('т')                   # => true
p 'こんにちは'.end_with?('は')              # => true

# eql?(object) → true or false
s = 'foo'
p s.eql?('foo') # => true
p s.eql?('food') # => false
p s.eql?('FOO') # => false
p "\u{e4 f6 fc}".encode("ISO-8859-1").eql?("\u{c4 d6 dc}") # => false

# force_encoding(encoding) → self
s = 'łał'
p s.bytes                   # => [197, 130, 97, 197, 130]
p s.encoding                # => #<Encoding:UTF-8>
p s.force_encoding('ascii') # => "\xC5\x82a\xC5\x82"
p s.encoding                # => #<Encoding:US-ASCII>
p s.valid_encoding?                 # => false
p s.force_encoding(Encoding::UTF_8) # => "łał"
p s.valid_encoding?                 # => true

# getbyte(index) → integer or nil
s = 'abcde'   # => "abcde"
p s.getbyte(0)  # => 97
p s.getbyte(-1) # => 101
p s.getbyte(5)  # => nil

# grapheme_clusters → array_of_grapheme_clusters
s = "\u0061\u0308-pqr-\u0062\u0308-xyz-\u0063\u0308" # => "ä-pqr-b̈-xyz-c̈"
p s.grapheme_clusters # => ["ä", "-", "p", "q", "r", "-", "b̈", "-", "x", "y", "z", "-", "c̈"]

# gsub(pattern, replacement) → new_string
# gsub(pattern) {|match| ... } → new_string
# gsub(pattern) → enumerator
# gsub!(pattern, replacement) → self or nil
# gsub!(pattern) {|match| ... } → self or nil
# gsub!(pattern) → an_enumerator

# hash → integer
h1 = {a: 1, b: 2}
h2 = {a: 1, b: 2}
h3 = {a: 1, c: 3}

p h1.hash        # => 1029497551  (some integer)
p h2.hash        # => 1029497551  (same as h1)
p h3.hash        # => 246435528    (different)

p h1.hash == h2.hash  # => true  (same contents → same hash)
p h1.hash == h3.hash  # => false

# hex → integer
p '0x0a'.hex        # => 10
p '-1234'.hex       # => -4660
p '0'.hex           # => 0
p 'non-numeric'.hex # => 0

# include?(other_string) → true or false
s = 'foo'
p s.include?('f')    # => true
p s.include?('fo')   # => true
p s.include?('food') # => false

# index(substring, offset = 0) → integer or nil
# index(regexp, offset = 0) → integer or nil
p 'foo'.index('f')         # => 0
p 'foo'.index('o')         # => 1
p 'foo'.index('oo')        # => 1
p 'foo'.index('ooo')       # => nil
p 'тест'.index('с')        # => 2
p 'こんにちは'.index('ち')   # => 3
p 'foo'.index(/o./) # => 1
p 'foo'.index(/.o/) # => 0
p 'foo'.index('o', 1)        # => 1
p 'foo'.index('o', 2)        # => 2
p 'foo'.index('o', 3)        # => nil
p 'тест'.index('с', 1)       # => 2
p 'こんにちは'.index('ち', 2)  # => 3
p 'foo'.index('o', -1)  # => 2
p 'foo'.index('o', -2)  # => 1
p 'foo'.index('o', -3)  # => 1
p 'foo'.index('o', -4)  # => nil
p 'foo'.index(/o./, -2) # => 1
p 'foo'.index(/.o/, -2) # => 1

# initialize_copy(other_string) -> self
s = 'foo'        # => "foo"
p s.replace('bar') # => "bar"

# insert(index, other_string) → self
p 'foo'.insert(1, 'bar') # => "fbaroo"
p 'foo'.insert(-2, 'bar') # => "fobaro"

# inspect → string
s = "foo\tbar\tbaz\n"
p s.inspect # => "\"foo\\tbar\\tbaz\\n\""

# intern → symbol
p "Koala".intern         #=> :Koala
s = 'cat'.to_sym       #=> :cat
p s == :cat              #=> true
s = '@cat'.to_sym      #=> :@cat
p s == :@cat             #=> true
p 'cat and dog'.to_sym   #=> :"cat and dog"

# length → integer
p 'foo'.length        # => 3
p 'тест'.length       # => 4
p 'こんにちは'.length   # => 5

p 'foo'.bytesize        # => 3
p 'тест'.bytesize       # => 8
p 'こんにちは'.bytesize   # => 15

# ljust(size, pad_string = ' ') → new_string
p 'hello'.ljust(10)       # => "hello     "
p '  hello'.ljust(10)     # => "  hello   "
p 'hello'.ljust(10, 'ab') # => "helloababa"
p 'тест'.ljust(10)        # => "тест      "
p 'こんにちは'.ljust(10)    # => "こんにちは     "
p 'hello'.ljust(5)  # => "hello"
p 'hello'.ljust(1)  # => "hello"

# lstrip → new_string
# lstrip! → self or nil
whitespace = "\x00\t\n\v\f\r "
s = whitespace + 'abc' + whitespace
p s        # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
p s.lstrip # => "abc\u0000\t\n\v\f\r "

# match(pattern, offset = 0) → matchdata or nil
# match(pattern, offset = 0) {|matchdata| ... } → object
# regexp = Regexp.new(pattern)
# matchdata = <tt>regexp.match(self)
p 'foo'.match('f') # => #<MatchData "f">
p 'foo'.match('o') # => #<MatchData "o">
p 'foo'.match('x') # => nil
p 'foo'.match('f', 1) # => nil
p 'foo'.match('o', 1) # => #<MatchData "o">
p 'foo'.match(/o/) {|matchdata| matchdata } # => #<MatchData "o">
p 'foo'.match(/x/) {|matchdata| matchdata } # => nil
p 'foo'.match(/f/, 1) {|matchdata| matchdata } # => nil

# match?(pattern, offset = 0) → true or false
p 'foo'.match?(/o/) # => true
p 'foo'.match?('o') # => true
p 'foo'.match?(/x/) # => false
p 'foo'.match?('f', 1) # => false
p 'foo'.match?('o', 1) # => true
p 'foo'.match?('o', 2) # => true

# next()
# next!()
# succ! → self
# succ → new_str
p 'THX1138'.succ # => "THX1139"
p '<<koala>>'.succ # => "<<koalb>>"
p '***'.succ # => '**+'
p 'aa'.succ # => "ab"
p 'az'.succ # => "ba"
p 'zz'.succ # => "aaa"
p 'AA'.succ # => "AB"
p 'AZ'.succ # => "BA"
p 'ZZ'.succ # => "AAA"

s = 0.chr * 3
p s # => "\x00\x00\x00"
p s.succ # => "\x00\x00\x01"
s = 255.chr * 3
p s # => "\xFF\xFF\xFF"
p s.succ # => "\x01\x00\x00\x00"

s = 'zz99zz99'
p s.succ # => "aaa00aa00"
s = '99zz99zz'
p s.succ # => "100aa00aa"
p ''.succ # => ""

# oct → integer
p '123'.oct             # => 83
p '-377'.oct            # => -255
p '0377non-numeric'.oct # => 255
p 'non-numeric'.oct     # => 0

# ord → integer # Returns the integer ordinal of the first character of self:
p 'h'.ord         # => 104
p 'hello'.ord     # => 104
p 'тест'.ord      # => 1090
p 'こんにちは'.ord  # => 12371

# partition(string_or_regexp) → [head, match, tail]
p 'hello'.partition('l')      # => ["he", "l", "lo"]
p 'hello'.partition('ll')     # => ["he", "ll", "o"]
p 'hello'.partition('h')      # => ["", "h", "ello"]
p 'hello'.partition('o')      # => ["hell", "o", ""]
p 'hello'.partition(/l+/)     #=> ["he", "ll", "o"]
p 'hello'.partition('')       # => ["", "", "hello"]
p 'тест'.partition('т')       # => ["", "т", "ест"]
p 'こんにちは'.partition('に')  # => ["こん", "に", "ちは"]
p 'hello'.partition('x') # => ["hello", "", ""]

# prepend(*other_strings) → string
s = 'foo'
p s.prepend('bar', 'baz') # => "barbazfoo"
p s                       # => "barbazfoo"

# replace(other_string) → self
s = 'foo'        # => "foo"
p s.replace('bar') # => "bar"

# reverse → string
p 'stressed'.reverse # => "desserts"

# reverse! → self
s = 'stressed'
p s.reverse! # => "desserts"
p s          # => "desserts"

# rindex(substring, offset = self.length) → integer or nil
# rindex(regexp, offset = self.length) → integer or nil
p 'foo'.rindex('f') # => 0
p 'foo'.rindex('o') # => 2
p 'foo'.rindex('oo') # => 1
p 'foo'.rindex('ooo') # => nil
p 'foo'.rindex(/f/) # => 0
p 'foo'.rindex(/o/) # => 2
p 'foo'.rindex(/oo/) # => 1
p 'foo'.rindex(/ooo/) # => nil
p 'foo'.rindex(/o+/) # => 2
p $~ #=> #<MatchData "o">
p 'foo'.rindex(/(?<!o)o+/) # => 1
p $~ #=> #<MatchData "oo">
p 'foo'.index(/o+(?!.*o)/) # => 1
p $~ #=> #<MatchData "oo">
p 'foo'.rindex('o', 0) # => nil
p 'foo'.rindex('o', 1) # => 1
p 'foo'.rindex('o', 2) # => 2
p 'foo'.rindex('o', 3) # => 2

p 'foo'.rindex('o', -1) # => 2
p 'foo'.rindex('o', -2) # => 1
p 'foo'.rindex('o', -3) # => nil
p 'foo'.rindex('o', -4) # => nil

# rjust(size, pad_string = ' ') → new_string
p 'hello'.rjust(10)       # => "     hello"
p 'hello  '.rjust(10)     # => "   hello  "
p 'hello'.rjust(10, 'ab') # => "ababahello"
p 'тест'.rjust(10)        # => "      тест"
p 'こんにちは'.rjust(10)    # => "     こんにちは"
p 'hello'.rjust(5, 'ab')  # => "hello"
p   'hello'.rjust(1, 'ab')  # => "hello"

# rpartition(sep) → [head, match, tail]
p 'hello'.rpartition('l')      # => ["hel", "l", "o"]
p 'hello'.rpartition('ll')     # => ["he", "ll", "o"]
p 'hello'.rpartition('h')      # => ["", "h", "ello"]
p 'hello'.rpartition('o')      # => ["hell", "o", ""]
p 'hello'.rpartition(/l+/)     # => ["hel", "l", "o"]
p 'hello'.rpartition('')       # => ["hello", "", ""]
p 'тест'.rpartition('т')       # => ["тес", "т", ""]
p 'こんにちは'.rpartition('に')  # => ["こん", "に", "ちは"]
p 'hello'.rpartition('x') # => ["", "", "hello"]

# rstrip → new_string
# rstrip! → self or nil
whitespace = "\x00\t\n\v\f\r "
s = whitespace + 'abc' + whitespace
p s        # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
p s.rstrip # => "\u0000\t\n\v\f\r abc"

# scan(string_or_regexp) → array
# scan(string_or_regexp) {|matches| ... } → self
s = 'cruel world'
p s.scan(/\w+/)      # => ["cruel", "world"]
p s.scan(/.../)      # => ["cru", "el ", "wor"] # create array of 3 chars
p s.scan(/(...)/)    # => [["cru"], ["el "], ["wor"]]
p s.scan(/(..)(..)/) # => [["cr", "ue"], ["l ", "wo"]]
s.scan(/\w+/) {|w| print "<<#{w}>> " }
print "\n"
s.scan(/(.)(.)/) {|x,y| print y, x }
print "\n"

# scrub(replacement_string = default_replacement) → new_string
# scrub{|bytes| ... } → new_string
# scrub! → self
# scrub!(replacement_string = default_replacement) → self
# scrub!{|bytes| ... } → self
s = "foo\x81\x81bar"
p s.scrub # => "foo��bar"
p "foo\x81\x81bar".scrub('xyzzy') # => "fooxyzzyxyzzybar"
p "foo\x81\x81bar".scrub {|bytes| p bytes; 'XYZZY' } # => "fooXYZZYXYZZYbar"

# setbyte(index, integer) → integer
s = 'abcde'      # => "abcde"
p s.setbyte(0, 98) # => 98
p s                # => "bbcde"

# size()
p 'foo'.length        # => 3
p 'тест'.length       # => 4
p 'こんにちは'.length   # => 5

# slice!(index) → new_string or nil
# slice!(start, length) → new_string or nil
# slice!(range) → new_string or nil
# slice!(regexp, capture = 0) → new_string or nil
# slice!(substring) → new_string or nil
string = "This is a string"
p string.slice!(2)        #=> "i"
p string.slice!(3..6)     #=> " is "
p string.slice!(/s.*t/)   #=> "sa st"
p string.slice!("r")      #=> "r"
p string                  #=> "Thing"

# split(field_sep = $;, limit = 0) → array
# split(field_sep = $;, limit = 0) {|substring| ... } → self
p 'abc def ghi'.split(' ')        # => ["abc", "def", "ghi"]
p "abc \n\tdef\t\n  ghi".split(' ') # => ["abc", "def", "ghi"]
p 'abc  def   ghi'.split(' ')     # => ["abc", "def", "ghi"]
p ''.split(' ')                   # => []
p 'abracadabra'.split('ab')  => ["", "racad", "ra"]
p 'aaabcdaaa'.split('a')    # => ["", "", "", "bcd"]
p ''.split('a')             # => []
p '3.14159'.split('1')      # => ["3.", "4", "59"]
p '!@#$%^$&*($)_+'.split('$') # => ["!@#", "%^", "&*(", ")_+"]
p 'тест'.split('т')         # => ["", "ес"]
p 'こんにちは'.split('に')    # => ["こん", "ちは"]
p 'abracadabra'.split(/ab/) # => ["", "racad", "ra"]
p 'aaabcdaaa'.split(/a/)  # => ["", "", "", "bcd"]
p 'aaabcdaaa'.split(//)   # => ["a", "a", "a", "b", "c", "d", "a", "a", "a"]
p '1 + 1 == 2'.split(/\W+/) # => ["1", "1", "2"]
p '1:2:3'.split(/(:)()()/, 2) # => ["1", ":", "", "", "2:3"]
p 'aaabcdaaa'.split('a')  # => ["", "", "", "bcd"]
p 'aaabcdaaa'.split('a', 1) # => ["aaabcdaaa"]
p 'aaabcdaaa'.split('a', 2) # => ["", "aabcdaaa"]
p 'aaabcdaaa'.split('a', 5) # => ["", "", "", "bcd", "aa"]
p 'aaabcdaaa'.split('a', 7) # => ["", "", "", "bcd", "", "", ""]
p 'aaabcdaaa'.split('a', 8) # => ["", "", "", "bcd", "", "", ""]
p 'aaabcdaaa'.split('a', -1) # => ["", "", "", "bcd", "", "", ""]
p 'abc def ghi'.split(' ') {|substring| p substring }

# squeeze(*selectors) → new_string
# squeeze!(*selectors) → self or nil
p "yellow moon".squeeze                  #=> "yelow mon"
p "  now   is  the".squeeze(" ")         #=> " now is the"
p "putters shoot balls".squeeze("m-z")   #=> "puters shot balls"

# start_with?(*string_or_regexp) → true or false
p 'hello'.start_with?('hell')               # => true
p 'hello'.start_with?(/H/i)                 # => true
p 'hello'.start_with?('heaven', 'hell')     # => true
p 'hello'.start_with?('heaven', 'paradise') # => false
p 'тест'.start_with?('т')                   # => true
p 'こんにちは'.start_with?('こ')              # => true

# strip → new_string
# strip! → self or nil
whitespace = "\x00\t\n\v\f\r "
s = whitespace + 'abc' + whitespace
p s       # => "\u0000\t\n\v\f\r abc\u0000\t\n\v\f\r "
p s.strip # => "abc"

# sub(pattern, replacement) → new_string
# sub(pattern) {|match| ... } → new_string
# sub!(pattern, replacement) → self or nil
# sub!(pattern) {|match| ... } → self or nil

# sum(n = 16) → integer
# Returns a basic n-bit checksum of the characters in self; the checksum is the sum of the binary value of each byte in self, modulo 2**n - 1:
p 'hello'.sum     # => 532
p 'hello'.sum(4)  # => 4
p 'hello'.sum(64) # => 532
p 'тест'.sum      # => 1405
p 'こんにちは'.sum  # => 2582

# swapcase(*options) → string
# swapcase!(*options) → self or nil
s = 'Hello World!' # => "Hello World!"
p s.swapcase         # => "hELLO wORLD!"

# to_c → complex
# Returns self interpreted as a Complex object; leading whitespace and trailing garbage are ignored:
p '9'.to_c                 # => (9+0i)
p '2.5'.to_c               # => (2.5+0i)
p '2.5/1'.to_c             # => ((5/2)+0i)
p '-3/2'.to_c              # => ((-3/2)+0i)
p '-i'.to_c                # => (0-1i)
p '45i'.to_c               # => (0+45i)
p '3-4i'.to_c              # => (3-4i)
p '-4e2-4e-2i'.to_c        # => (-400.0-0.04i)
p '-0.0-0.0i'.to_c         # => (-0.0-0.0i)
p '1/2+3/4i'.to_c          # => ((1/2)+(3/4)*i)
p '1.0@0'.to_c             # => (1+0.0i)
p "1.0@#{Math::PI/2}".to_c # => (0.0+1i)
p "1.0@#{Math::PI}".to_c   # => (-1+0.0i)
p 'ruby'.to_c        # => (0+0i)

# to_f → float
p '3.14159'.to_f  # => 3.14159
p '1.234e-2'.to_f # => 0.01234
p 'abcdef'.to_f # => 0.0

# to_i(base = 10) → integer
p '123456'.to_i     # => 123456
p '123def'.to_i(16) # => 1195503
p '123def'.to_i(0)   # => 123
p '0123def'.to_i(0)  # => 83
p '0b123def'.to_i(0) # => 1
p '0o123def'.to_i(0) # => 83
p '0d123def'.to_i(0) # => 123
p '0x123def'.to_i(0) # => 1195503
p '12.345'.to_i   # => 12
p '12345'.to_i(2) # => 1
p 'abcdef'.to_i # => 0
p '2'.to_i(2)   # => 0

# to_r → rational
p '  2  '.to_r       #=> (2/1)
p '300/2'.to_r       #=> (150/1)
p '-9.2'.to_r        #=> (-46/5)
p '-9.2e2'.to_r      #=> (-920/1)
p '1_234_567'.to_r   #=> (1234567/1)
p '21 June 09'.to_r  #=> (21/1)
p '21/06/09'.to_r    #=> (7/2)
p 'BWV 1079'.to_r    #=> (0/1)
p "0.3".to_r == 3/10r  #=> true
p 0.3.to_r   == 3/10r  #=> false

# to_s → self or string
# to_str()

# to_sym → symbol
# "Koala".intern         #=> :Koala
s = 'cat'.to_sym       #=> :cat
p s == :cat              #=> true
s = '@cat'.to_sym      #=> :@cat
p s == :@cat             #=> true

# tr(selector, replacements) → new_string
# tr!(selector, replacements) → self or nil
p 'hello'.tr('el', 'ip') #=> "hippo"
p 'hello'.tr('aeiou', '-')   # => "h-ll-"
p 'hello'.tr('aeiou', 'AA-') # => "hAll-"
# Negation.
p 'hello'.tr('^aeiou', '-') # => "-e--o"
# Ranges.
p 'ibm'.tr('b-z', 'a-z') # => "hal"
# Escapes.
p 'hel^lo'.tr('\^aeiou', '-')     # => "h-l-l-"    # Escaped leading caret.
p 'i-b-m'.tr('b\-z', 'a-z')       # => "ibabm"     # Escaped embedded hyphen.
p 'foo\\bar'.tr('ab\\', 'XYZ')    # => "fooZYXr"   # Escaped backslash.

# tr_s(selector, replacements) → string
# tr_s!(selector, replacements) → self or nil
p 'hello'.tr_s('l', 'r')   #=> "hero"
p 'hello'.tr_s('el', '-')  #=> "h-o"
p 'hello'.tr_s('el', 'hx') #=> "hhxo"

# undump → string
s_orig = "\f\x00\xff\\\""    # => "\f\u0000\xFF\\\""
s_dumped = s_orig.dump       # => "\"\\f\\x00\\xFF\\\\\\\"\""
s_undumped = s_dumped.undump # => "\f\u0000\xFF\\\""
p s_undumped == s_orig         # => true

# unicode_normalize(form = :nfc) → string
# unicode_normalize!(form = :nfc) → self
p "a\u0300".unicode_normalize      # => "a"
p "\u00E0".unicode_normalize(:nfd) # => "a "

# unicode_normalized?(form = :nfc) → true or false
p "a\u0300".unicode_normalized?       # => false
p "a\u0300".unicode_normalized?(:nfd) # => true
p "\u00E0".unicode_normalized?        # => true
p "\u00E0".unicode_normalized?(:nfd)  # => false
s = "\xE0".force_encoding('ISO-8859-1')
# s.unicode_normalized? # Raises Encoding::CompatibilityError.

# unpack(template, offset: 0, &block) → array
# unpack1(template, offset: 0) → object
# Like String#unpack, but unpacks and returns only the first extracted object. See Packed Data.
p 'A'.unpack('C')   # => [65]      # One character, one directive.
p 'AB'.unpack('CC') # => [65, 66]  # Two characters, two directives.
p 'AB'.unpack('C')  # => [65]      # Extra character is ignored.
p 'A'.unpack('CC')  # => [65, nil] # Extra directive generates nil.
p 'AB'.unpack('')   # => []        # No directives.

# upcase(*options) → string
s = 'Hello World!' # => "Hello World!"
p s.upcase           # => "HELLO WORLD!"

# upcase!(*options) → self or nil
s = 'Hello World!' # => "Hello World!"
p s.upcase!          # => "HELLO WORLD!"
p s                  # => "HELLO WORLD!"
p s.upcase!          # => nil

# upto(other_string, exclusive = false) {|string| ... } → self
# upto(other_string, exclusive = false) → new_enumerator
'a8'.upto('b6') {|s| print s, ' ' } # => "a8"
'a8'.upto('b6', true) {|s| print s, ' ' } # => "a8"
'25'.upto('5') {|s| fail s }
'aa'.upto('a') {|s| fail s }
'a8'.upto('b6') # => #<Enumerator: "a8":upto("b6")>

# valid_encoding? → true or false
p "\xc2\xa1".force_encoding("UTF-8").valid_encoding? # => true
p "\xc2".force_encoding("UTF-8").valid_encoding?     # => false
p "\x80".force_encoding("UTF-8").valid_encoding?     # => false