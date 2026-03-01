# slice vs byteslice
# Use slice (99% of cases):
    # Normal text processing
    # User-facing strings
    # Don't care about encoding details

# Use byteslice:
    # Binary protocols
    # Low-level parsing (HTTP, images)
    # Exact byte offsets from C libs
    # Working with .b (binary) strings

# tr vs gsub vs sub
# tr vs gsub vs sub: Ruby String Methods
# All three transform strings, but differ in scope, matching, and performance.


=begin
| Method | Matches                  | Replaces              | Returns    |
| ------ | ------------------------ | --------------------- | ---------- |
| sub    | First occurrence         | Pattern → replacement | New string |
| gsub   | All occurrences          | Pattern → replacement | New string |
| tr     | Characters (by position) | 1:1 char mapping      | New string |
=end

s = "hello lolly"

# sub: first match only
s.sub('l', 'x')      # => "hexlo lolly"

# gsub: all matches  
s.gsub('l', 'x')     # => "hexxo xoxxy"

# tr: char-by-char translation (ignores length)
s.tr('l', 'x')       # => "hexxo xoxxy" (all l→x)
s.tr('lo', 'pq')     # => "heppq pqqqy" (l→p, o→q)


# Key Differences
# 1. Scope
"mississippi".sub(/i/, "!")   # => "m!ssissippi"  (1st i)
"mississippi".gsub(/i/, "!")  # => "msss!ss!pp!"  (all i's)
# 2. tr = Translation Table
"foo:bar".tr('o:a', '1@')     # => "f11:b@r"  (o→1, o→1, a→@)
"foo:bar".gsub('o', '1')      # => "ff1:bar"  (only 1st o)
3. Ranges (tr only)
"aBcDeF".tr('a-z', 'A-Z')     # => "ABCDEF"  (all lowercase → uppercase)
"aBcDeF".gsub(/[a-z]/, 'X')   # => "XXXDXXX" (wrong length!)
# When to Use
# sub: One-off replacement (URLs, paths)

# gsub: Multiple regex replacements (sanitization, formatting)

# tr: Char translation (case, normalization, punctuation) — much faster