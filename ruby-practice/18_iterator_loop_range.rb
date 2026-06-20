p "ITERATORS"

# each { |a| ..} / each do |a| ... end
# collect -> retun result
# times
# upto
# downto
# step
# each_line

p "OTHER Iterators"
# map -> return result
# select
# reject
# reduce(:+) / reduce(10) { |sum, n| sum + n * 2 }
# inject(0) { |sum, n| sum + n }/ inject(:+)
# any?
# all?
# none?
# one?
# detect - scanning until found
# find
# drop / drop(n)
# each_with_object
# tally
# sum
# each_slice
# each_cons
# count
# find_index

p "RANGERS"
# ranges = (7 .. 10).to_a 	.. -> Include last element
# ranges = (7 ... 10).to_a 	... -> Exclude last element
# include?
# max
# min
# each
# case when end
# ===
# to_a

p "LOOPS"
# while ... end
# for a in arr do ...end
# loop do... break...end
# begin... end while answer == 'Y'
# until... end
# each
# to_a.reverse.each
# times
# upto
# downto
# 1.step(10,2)
# 5.times.with_index(start_index)
# select