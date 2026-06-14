# op = (regex).match(string)
# op[index]
# op[index, count]
# op[range]

# a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
# a.begin(1) -> index of the 1st element
# a.capture -> list of element as array
# a.end(0) -> element index from end
# a.length(a.size)
# a.offset(2) ->  two-element array that consist of starting and ending offset of the nth match
# a.post_match -> string post match
# a.pre_match -> String before match
# a.to_a -> array of match elements
# a.to_a.select -> select element based on condition block
# a.string -> string of element to be matched from
# a.values_at(2, 0) -> value at passed index
# == -> check if both MatchData

p "======================REGULAR EXPRESSION================="
# str.match(regex)
# str =~ /[aeiou]/
# \w - characters and numbers
# \d
# \s - white space
# \W - other then [A_Za-z0-9_]
# \D - not a number
# \S - Doesn't contain space

# /a+ - should contain 1 number
# /a* - include 0 or more character
# "colour".match?(/colou?r/)
# ?, *
# i - ignore case
# {2,4} - range of character
# x → Extended mode (ignore whitespace & allow comments)
# m → Multiline (dot matches newline in Ruby)
# u, e, s, n → Encoding modifiers

p "==================SEARCH AND REPLACE=================="
# sub, sub!
# gusb, gsub!
# tr, tr!