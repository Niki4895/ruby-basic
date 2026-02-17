# sub and gsub string methods that use regular expressions, and their in-place variants are sub! and gsub!. The sub & sub! replaces the first occurrence of the pattern and gsub & gsub! replaces all occurrences. All of these methods perform a search-and-replace operation using a Regexp pattern. sub! and gsub! modify the string on which they are called whereas the sub and gsub returns a new string, leaving the original unmodified. Below is the example to understand it better.

roll = "2004-959-559 # This is Roll Number"

# Delete Ruby-style comments
roll = roll.sub!(/#.*$/, "")   
puts "Roll Num : #{roll}"

# Remove anything other than digits
roll = roll.gsub!(/\D/, "")    
puts "Roll Num : #{roll}"

# Ruby program of sub and gsub method
text = "geeks for geeks, is a computer science portal"

# Change "rails" to "Rails" throughout
text.gsub!("geeks", "Geeks")

# Capitalize the word "Rails" throughout
text.gsub!(/\bgeeks\b/, "Geeks")
puts "#{text}"
