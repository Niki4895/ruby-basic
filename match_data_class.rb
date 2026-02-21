# Instance Method
# [] : It is known as Match Reference. In this MatchData is behaves like an array and may be accessed by using normal array indexing technique. In this match[0] is equivalent to special variable $& and it returns the entire matched string. match[1], match[2], match[3] and so on, return the match back reference value.

a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks12.")
p a # ks12
p a[0] # ks12
p a[1, 4] # ["k", "s", "1", "2"]
p a[1..2] # ["k", "s"]
p a[-2, 1] # ["1"]

# begin : This method returns the offset of the start of the nth element of the match array in the string.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
p a.begin(1) # 11
p a.begin(2) # 12

# captures : This methods return the array of all the matching groups.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
p a.captures # ["k", "s", "11", "2"]

# end : This method returns the offset into the character that immediately following the end of the nth element of thematch array in the string.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
p a
p a.end(0) # 16
p a.end(3) # 13

# length : This method returns the number of elements present in the match array.
# Using length method
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
p a.length # 5
# using size method
p a.size # 5

# offset : This method return a two-element array that consist of starting and ending offset of the nth match.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112.")
p a.offset(2) # [12, 13]
p a.offset(1) # [11, 12]

# post_match : This method returns the piece of the original string after the current match. Identical to the special variable $'.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.post_match # ": Ruby"

# pre_match : This method returns the piece of the original string before the currentmatch. Identical to the special variable $`.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.pre_match # "GeeksFORgee"

# to_a : This method returns the array of matches.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.to_a # ["ks112", "k", "s", "11", "2"]

# select : This method return an array that consist of all the elements of match for which the block is true.
match = /(.)(.)(\d+)(\d)/.match("THX1138.")
selected = match.to_a.select { |cap| cap.length > 2 }
puts selected.inspect  # ["HX1138", "113"]

# string : This method return a frozen copy of the string passed in the match.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.string # "GeeksFORgeeks112: Ruby"

# to_s : This method returns the whole matched string.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.to_s # ks112

# values_at : In this method index is used to access the matching values and return an array of corresponding match.
a = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a.values_at(2, 0) # ["s", "ks112"]

# == : It is known as Equality. It is used to check if both MatchData, i.e match1 and match2 are equal or not. If they are equal, then return true, otherwise return false. 
b = /(.)(.)(\d+)(\d)/.match("GeeksFORgeeks112: Ruby")
p a == b # true 
p a == match # false
