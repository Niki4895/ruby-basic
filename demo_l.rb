p $-l          # show whether -l is set
p $/           # input record separator
p $\           # output record separator

$_ = $_.upcase if $-l
