p "================ INTEGER ========================="
# to_i
# chr -> ASCII Character
# floor -> lower value
# integer? 
# next(succ)
# round -> integer

# no.downto(no) -> Reverse Looping
# times -> number of time looping
# no.upto(no) -> looping

p "=============Numeric ==============================="

# +, -, *, /, %, **, -(no)
# <=>, ==, abs(convert in positive no)
# ceil(4.1 = 5), divmod(return div and modulo), eql?(check class as well), finite?(Div is finite or not)
# floor(4.9 = 4), infinite?(Div is infinite ot not),modulo(32.45.modulo(20)), nan?(Float is valid or not)
# round or round(no)

# to_f, to_i, to_int, to_s, to_d
# truncate(remove precision value), zero?
# Float::INFINITY
# Float::NAN
# Float::EPSILON
# Float::DIG
# Float::INFINITY
# Float::MANT_DIG
# Float::MAX
# Float::MAX_10_EXP
# Float::MAX_EXP
# Float::MIN
# Float::MIN_10_EXP
# Float::MIN_EXP
# Float::RADIX

p "======================STRING======================"

# sub, sub!
# gsub, gsub!


# remove spaces from left right and both
# lstrip, lstrip!, rstrip, rstrip!, strip, strip!

# Access String ans sub string at position start from 0
# str[no/-no]
# str[no/-no, no_of_chr/-no_of_chr]
# string[range]
# string[regexp, capture = 0]
# str[sub_str]-> check if present or not
# new(string = '', **opts)
# try_convert(object) → object
# string % object → new_string -> print format option
# string * integer → new_string
# string + other_string → new_string
# string << object → string
# +string → new_string or self
# str.freeze
# str.frozen?
# -string → frozen_string
# string <=> other_string
# string == object 
# string === object
# string =~ regexp → integer or nil

# append_as_bytes
# valid_encoding?
# ascii_only? → true or false
# encoding
# bytes
# bytesize
# byteindex(substring/regex, offset = 0) → integer
# byterindex(substring/regex, offset = self.bytesize)
# byteslice(index, length = 1)/  byteslice(range)
# bytesplice(index, length, str) → string 
    # bytesplice(index, length, str, str_index, str_length) → string
    # bytesplice(range, str) → string
    # bytesplice(range, str, str_range) → string

# capitalize, capitalize!
# casecmp -> 0, 1, -1, nil
# center(no)
# chars -> char array
# chomp, chomp! -> remove character as well
# chop, chop!
# chr  - first character
# clear
# codepoints -> array of integer
# concat
# count(selector)
# crypt(salt_str) → new_string

# delete, delete!
# delete_prefix, delete_prefix!
# delete_suffix, delete_suffix!
# downcase, downcase!
# dump -> add extra chars
# undump
# each_byte
# each_char
# each_codepoint
# each_grapheme_cluster
# each_line
# empty? 
# force_encoding
# default_internal
# encode
# encoding
# bytes
# end_with?
# eql?
# getbyte(index)
# grapheme_clusters 
# hash
# hex
# oct
# include?
# index(substring/regex, offset = 0) 
# initialize_copy(other_string), replace
# insert(index, other_string)
# inspect
# intern/to_sym
# length
# ljust(size, pad_string = ' ')
# rjust(size, pad_string = ' ')

# match
# match?
# succ
# ord -> ordinal
# partition(string_or_regexp)
# rpartition(string_or_regexp)

# prepend(*other_strings)
# reverse, reverse!
# rindex(substring/regex, offset = self.length)
# scan(string_or_regexp) → array
# scrub(replacement_string = default_replacement) 
# scrub@(replacement_string = default_replacement) 
# setbyte(index, integer)
# size()/length
# slice!(index/start, length/range ) → new_string or nil
# split(field_sep = $;, limit = 0) → array
# squeeze(*selectors) → new_string,  squeeze!(*selectors) → new_string
# start_with?(*string_or_regexp)
# sum(n = 16)
# swapcase(*options), swapcase!(*options) 
# to_c
# to_f
# to_i(base = 10)
# to_r → rational
# to_s/ to_str()
# tr(selector, replacements)/ tr!(selector, replacements)
# tr_s(selector, replacements) → string / tr_s!(selector, replacements) → self or nil
# unicode_normalize(form = :nfc)/ unicode_normalize!(form = :nfc) 
# unicode_normalized?(form = :nfc)
# unpack(template, offset: 0, &block) 
# upcase(*options) / upcase!(*options)

p "=================SYMBOL=============================="
# object_id
# Symbol.all_symbols.size 
# id2name(to_s) -> string of symbol
# inspect
# <=>
# a==b
# []
# capitalize
# casecmp
# downcase
# length
# slice(index)
# swapcase
# upcase
# collect(&:to_s)
# to_sym