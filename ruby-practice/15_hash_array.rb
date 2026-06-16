p "======================HASH========================="

grades = { "Jane Doe" => 10, "Jim Doe" => 6 }
grades["Jane Doe"]
options = { :font_size => 10, :font_family => "Arial" }
options = { font_size: 20, font_family: "Arial 2" }
options[:font_size]

books         = {}
books[:matz]  = "The Ruby Programming Language"
books[:black] = "The Well-Grounded Rubyist"
p books

grades = Hash.new(0)
grades = {"Timmy Doe" => 8}
grades.default = 21
puts grades["Jane Doe"] # => 21
puts grades["Timmy Doe"] # => 8

p "PUBLIC CLASS METHODS"
# Hash[ key, value, ... / [ [key, value], ... ] / object]
# new()/new(obj)/new {|hash, key| block }
# ruby2_keywords_hash(hash)
# ruby2_keywords_hash?(hash) 
# try_convert(obj)

# h = Hash.new("Go Fish") -> set value for undefined key

p "PUBLIC INSTANCE METHODS"
# hash < other
# hash <= other
# hsh == other_hash -> check if hash is shuffled
# hash > other
# hash >= other
# hsh[key]
# hsh[key] = value
# any? [{ |(key, value)| block } / pattern]
# assoc(obj) → an_array or nil
# clear -> clear hash
# compact -> remove nil value
# compact!
# compare_by_identity
# compare_by_identity?
# deconstruct_keys(p1)
# default(key=nil) -> return default value
# default = obj -> set default value
# default_proc = proc_obj or nil
# delete(key)(delete(key) {| key | block } )
# delete_if {| key, value | block }
# dig(key, ...)
# each {| key, value | block } → hsh
# each_pair {| key, value | block } → hsh
# each_key {| key | block } → hsh
# each_value {| value | block } → hsh
# empty?
# eql?(other) -> check exact dup hash
# fetch(key [, default] ) (fetch(key) {| key | block }) -> if default not passed it raise an array
# fetch_values(key, ...)(fetch_values(key, ...) { |key| block })
# select {|key, value| block}(filter {|key, value| block}) 
# select! {|key, value| block}(filter!{|key, value| block}) 
# flatten(flatten(level))
# has_key?(key)(include?(key), key?(key), member?(key))
# has_value?(value) 
# hash -> integer
# replace(other_hash)(initialize_copy(other_hash))
# to_s(inspect)
# invert -> key to value and value to key
# keep_if {| key, value | block } 
# key(value) 
# keys
# size(length)
# merge(h1, h2, ...)(merge(h1, h2,..) {|key, oldval, newval| block}, update(h1, h2, ...), update(h1, h2, ...) {|key, oldval, newval| block} )
# merge!(h1, h2, ...)(merge!(h1, h2,..) {|key, oldval, newval| block}
# rassoc(obj) -> based on value return array
# rehash
# reject {|key, value| block}(reject!{|key, value| block})
# shift -> remove first element from hash
# slice(*keys) -> fetch multiple keys data
# store(key, value) -> add key and value in the hash
# to_a
# to_h(to_h {|key, value| block }, to_hash)
# to_proc(call)
# transform_keys {|key| block } -> to_s or to_sym
# transform_keys! {|key| block }
# transform_values {|value| block } 
# transform_values! {|value| block } 
# value?(value) 
# values
# values_at(key, ...) -> array
# except(*keys)

# h.default_proc = proc do |hash, key|
#   hash[key] = key + key
# end

p "==================ARRAY METHODS================================="

# [](*args)
# new, new(array), new(size), new(size, default_value), new(size) {|index| ... }
# try_convert(object)
# array * n(array * string_separator)
# array + other_array
# array - other_array
# array << object
# array <=> other_array
# array == other_array
# array[index], array[start, length], array[range], array[aseq], slice(index), slice(start, length), slice(range), slice(aseq)
# array[index], array[start, length], array[range] = object, 
# all?(all? {|element| ... }, all?(obj))
# any?(any? {|element| ... }, any?(obj))
# append(*args)
# assoc(obj) -> check array in array
# at(index) 
# bsearch {|element| ... }(bsearch_index {|element| ... })
# clear
# map {|element| ... }(map! {|element| ... })
# combination(n) {|element| ... }
# compact(compact!)
# concat(*other_arrays) > create single array
# count(count(obj),count {|element| ... } )
# cycle {|element| ... }(cycle(count) {|element| ... }, cycle(count))
# deconstruct()
# delete(obj)(delete(obj) {|nosuch| ... } )
# delete_at(index) 
# delete_if {|element| ... }
# difference(*other_arrays) 
# dig(index, *identifiers)-> find from nested array
# drop(n) -> remove n element from array
# drop_while {|element| ... } → new_array
# each {|element| ... }
# each_index {|index| ... }
# empty?
# eql? other_array
# fetch(index) / fetch(index, default_value) / fetch(index) {|index| ... }
# fill(obj), fill(obj, start), fill(obj, start, length), fill(obj, range)
# fill {|index| ... }, fill(start) {|index| ... }, fill(start, length) {|index| ... }, fill(range) {|index| ... }
# select {|element| ... } / select! {|element| ... }
# index(object) / index {|element| ... }
# first / first(n)
# flatten / flatten!
# hash
# include?(obj)
# replace(other_array)
# insert(index, *objects)
# intersect?(other_ary)
# intersection(*other_arrays)
# join / join(separator)
# keep_if {|element| ... }
# last / last(n)
# length
# max / max {|a, b| ... }/ max(n) /max(n) {|a, b| ... }
# min / min {|a, b| ... }/ min(n) /min(n) {|a, b| ... }
# minmax → [min_val, max_val] / minmax {|a, b| ... } → [min_val, max_val]
# none? / none? {|element| ... } / none?(obj)
# one? / one? {|element| ... } / one?(obj)
# pack( aTemplateString ) / pack( aTemplateString, buffer: aBufferString )
# permutation {|element| ... }/ permutation(n) {|element| ... } / permutation / permutation(n) 
# pop / pop(n)
# prepend(*args) / unshift
# product(*other_arrays) / product(*other_arrays) {|combination| ... } 
# push(*objects)
# rassoc(obj) -> check last element if sub array
# reject {|element| ... } / reject! {|element| ... }
# repeated_combination(n) {|combination| ... }
# repeated_permutation(n) {|permutation| ... }
# reverse / reverse!
# reverse_each {|element| ... } 
# rindex(object) / rindex {|element| ... }
# rotate / rotate(count)
# rotate! / rotate!(count)
# sample(random: Random) /  sample(n, random: Random)
# shift/ shift(n)
# shuffle(random: Random) / shuffle!(random: Random)
# slice(index)/ slice(start, length)/ slice(range) / slice(aseq)
# slice!(index)/ slice!(start, length)/ slice!(range)
# sort / sort {|a, b| ... } / sort! / sort! {|a, b| ... } 
# sort_by! {|element| ... }
# sum(init = 0) / sum(init = 0) {|element| ... }
# take(n)
# take_while {|element| ... }
# to_a / to_ary
# to_h / to_h {|item| ... }
# transpose
# union(*other_arrays)
# uniq {|element| ... } / uniq!{|element| ... }
# unshift(*objects)
# values_at(*indexes) 
# zip(*other_arrays) / zip(*other_arrays) {|other_array| ... }
# array | other_array