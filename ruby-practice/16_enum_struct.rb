# yield -> execute passed block
# all? -> no nil or false value or condition
# any? -> any true value or condition
# chain(*enums) -> add some other enums in array
# to_a
# chunk {|array| ... } -> [0, [0, 1, 2]]  Chunk consecutive odd and even numbers
# chunk_while {|elt_before, elt_after| bool }
# collect / map
# collect_concat / flat_map
# compact
# count / count(object) / count {|element| ... }
# cycle(n = nil) {|element| ...}
# find(if_none_proc = nil) {|element| ... } /find(if_none_proc = nil)
    # (0..9).find(proc {'Non Found'})
# drop(n) 
# drop_while {|element| ... } 
# each_cons(n) { ... } /  each_cons(n) -> duplicate element
# each_entry(*args) {|element| ... } 
# each_slice(n) { ... } /  each_slice(n) -> new element
# each_with_index(*args) {|element, i| ..... } / each_with_index(*args) 
# each_with_object(object) { |(*args), memo_object| ... } / each_with_object(object)
# entries(*args) / to_a
# filter() / find_all / select {|element| ... }
# filter_map {|element| ... } / filter_map
# find_index(object)  / find_index {|element| ... }
# first / first(n)
# grep(pattern) / grep(pattern) {|element| ... }
# grep_v(pattern) / grep_v(pattern) {|element| ... } - opp of grep
# group_by {|element| ... } / group_by
# include? / member?
# inject(symbol) / inject(initial_value, symbol) / inject {|memo, value| ... } 
    # inject(initial_value) {|memo, value| ... } / reduce(p1 = v1, p2 = v2)
# lazy
# map {|element| ... } 
# max / max(n) / max {|a, b|...} / max(n) {|a, b| ... } 
# max_by {|element| ... } / max_by(n) {|element| ... } / max_by / max_by(n)
# min / min(n) / min {|a, b|...} / min(n) {|a, b| ... } 
# min_by {|element| ... } / min_by(n) {|element| ... } / min_by / min_by(n)
# minmax / minmax {|a, b| ... }  ->  [minimum, maximum]
# minmax_by {|element| ... } / minmax_by
# none? / none?(pattern) / none? {|element| ... }
# one? / one?(pattern) / one? {|element| ... }
# partition {|element| ... }
# reject {|element| ... }
# reverse_each(*args) {|element| ... }
# slice_after(pattern) / slice_after { |elt| bool }
# slice_before(pattern) / slice_before {|elt| ... }
# slice_when {|elt_before, elt_after| bool }
# sort {|a, b| ... } 
# sort_by {|element| ... }
# sum(initial_value = 0) {|element| ... }
# take(n)
# take_while {|element| ... }
# tally(hash = {})
# to_h(*args) {|element| ... } 
# uniq {|element| ... } 
# zip(*other_enums) {|array| ... }


p "STRUCT / OPEN Struct"
# Struct.new(:name, :age)
# new ->
    Struct.new("Geek", :tutorial_name, :topic_name)
    Struct::Geek.new("ruby", "Struct")
# str == other_struct
# [] -> str[tutorial_name], str.tutorial_name, str['tutorial_name']
# []= -> str[tutorial_name], str.tutorial_name, str['tutorial_name'] = value
# each
# each_pair
# length /size
# members
# to_a / values
# values_at

# require 'ostruct'
# OpenStruct.new
# person.name = 'test'
# h = { a: 1, b: 2 }
# o = OpenStruct.new(h)