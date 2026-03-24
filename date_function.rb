# 'date' provides two classes: Date and DateTime.

# Calendar Date - The calendar date is a particular day of a calendar year, identified by its ordinal number within a calendar month within that year.(civil)
# Ordinal Date - The ordinal date is a particular day of a calendar year identified by its ordinal number within the year.
# Week Date - The week date is a date identified by calendar week and day numbers.
# Julian Day Number - The Julian day number is in elapsed days since noon (Greenwich Mean Time) on January 1, 4713 BCE (in the Julian calendar).
# Modified Julian Day Number - The modified Julian day number is in elapsed days since midnight (Coordinated Universal Time) on November 17, 1858 CE (in the Gregorian calendar).

require 'date'

=begin
Constants
ABBR_DAYNAMES
An array of strings of abbreviated day names in English. The first is “Sun”.

ABBR_MONTHNAMES
An array of strings of abbreviated month names in English. The first element is nil.

DAYNAMES
An array of strings of the full names of days of the week in English. The first is “Sunday”.

ENGLAND
The Julian day number of the day of calendar reform for England and her colonies.

GREGORIAN
The Julian day number of the day of calendar reform for the proleptic Gregorian calendar.

ITALY
The Julian day number of the day of calendar reform for Italy and some catholic countries.

JULIAN
The Julian day number of the day of calendar reform for the proleptic Julian calendar.

MONTHNAMES
An array of strings of full month names in English. The first element is nil.
=end

# _httpdate(string) → hash
p Date._httpdate('Sat, 03 Feb 2001 00:00:00 GMT') # {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>0, :min=>0, :sec=>0, :zone=>"GMT", :offset=>0}

# _iso8601(string) → hash
p Date._iso8601('2001-02-03T04:05:06+07:00') # {:mday=>3, :year=>2001, :mon=>2, :hour=>4, :min=>5, :sec=>6, :zone=>"+07:00", :offset=>25200}
p Date._iso8601('2001-02-03') # {:mday=>3, :year=>2001, :mon=>2}

# _jisx0301(string) → hash
p Date._jisx0301('H13.02.03T04:05:06+07:00') # {:year=>2001, :mon=>2, :mday=>3, :hour=>4, :min=>5, :sec=>6, :zone=>"+07:00", :offset=>25200}
p Date._jisx0301('H13.02.03') # {:year=>2001, :mon=>2, :mday=>3}

# _parse(string[, comp=true]) → hash
p Date._parse('2001-02-03') #=> {:year=>2001, :mon=>2, :mday=>3}

# _rfc2822(string) → hash
p Date._rfc2822('Sat, 3 Feb 2001 04:05:06 +0700') # {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>4, :min=>5, :sec=>6, :zone=>"+0700", :offset=>25200}

# _rfc3339(string) → hash
p Date._rfc3339('2001-02-03T04:05:06+07:00') # {:year=>2001, :mon=>2, :mday=>3, :hour=>4, :min=>5, :sec=>6, :zone=>"+07:00", :offset=>25200}

# _rfc822(string) → hash
p Date._rfc2822('Sat, 3 Feb 2001 04:05:06 +0700') # {:wday=>6, :mday=>3, :mon=>2, :year=>2001, :hour=>4, :min=>5, :sec=>6, :zone=>"+0700", :offset=>25200}

# _strptime(string[, format='%F']) → hash
p Date._strptime('2001-02-03', '%Y-%m-%d') #=> {:year=>2001, :mon=>2, :mday=>3}

# _xmlschema(string) → hash
p Date._xmlschema('2001-02-03T04:05:06+07:00') # {:year=>2001, :mon=>2, :mday=>3, :hour=>4, :min=>5, :sec=>6, :zone=>"+07:00", :offset=>25200}

# civil([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
p Date.new(2001)            #=> #<Date: 2001-01-01 ...>
p Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
p Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>

# commercial([cwyear=-4712[, cweek=1[, cwday=1[, start=Date::ITALY]]]]) → date
p Date.commercial(2001)     #=> #<Date: 2001-01-01 ...>
p Date.commercial(2002)     #=> #<Date: 2001-12-31 ...>
p Date.commercial(2001,5,6) #=> #<Date: 2001-02-03 ...>

# gregorian_leap?(year) → bool
p Date.gregorian_leap?(1900)        #=> false
p Date.gregorian_leap?(2000)        #=> true
p Date.gregorian_leap?(2004)        #=> true

# httpdate(string='Mon, 01 Jan -4712 00:00:00 GMT'[, start=Date::ITALY]) → date
p Date.httpdate('Sat, 03 Feb 2001 00:00:00 GMT') #=> #<Date: 2001-02-03 ...>

# iso8601(string='-4712-01-01'[, start=Date::ITALY]) → date
p Date.iso8601('2001-02-03')        #=> #<Date: 2001-02-03 ...>
p Date.iso8601('20010203')          #=> #<Date: 2001-02-03 ...>
p Date.iso8601('2001-W05-6')        #=> #<Date: 2001-02-03 ...>

# jd([jd=0[, start=Date::ITALY]]) → date
p Date.jd(2451944)          #=> #<Date: 2001-02-03 ...>
p Date.jd(2451945)          #=> #<Date: 2001-02-04 ...>
p Date.jd(0)                #=> #<Date: -4712-01-01 ...>

# jisx0301(string='-4712-01-01'[, start=Date::ITALY]) → date
p Date.jisx0301('H13.02.03')                #=> #<Date: 2001-02-03 ...>

# julian_leap?(year) → bool
p Date.julian_leap?(1900)           #=> true
p Date.julian_leap?(1901)           #=> false

# leap?(year) → bool
p Date.leap?(1900)        #=> false
p Date.leap?(2000)        #=> true

# new([year=-4712[, month=1[, mday=1[, start=Date::ITALY]]]]) → date
p Date.new(2001)            #=> #<Date: 2001-01-01 ...>
p Date.new(2001,2,3)        #=> #<Date: 2001-02-03 ...>
p Date.new(2001,2,-1)       #=> #<Date: 2001-02-28 ...>

# ordinal([year=-4712[, yday=1[, start=Date::ITALY]]]) → date
p Date.ordinal(2001)        #=> #<Date: 2001-01-01 ...>
p Date.ordinal(2001,34)     #=> #<Date: 2001-02-03 ...>
p Date.ordinal(2001,-1)     #=> #<Date: 2001-12-31 ...>

# parse(string='-4712-01-01'[, comp=true[, start=Date::ITALY]]) → date
p Date.parse('2001-02-03')          #=> #<Date: 2001-02-03 ...>
p Date.parse('20010203')            #=> #<Date: 2001-02-03 ...>
p Date.parse('3rd Feb 2001')        #=> #<Date: 2001-02-03 ...>

# rfc2822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=Date::ITALY]) → date
p Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000') #=> #<Date: 2001-02-03 ...>

# rfc3339(string='-4712-01-01T00:00:00+00:00'[, start=Date::ITALY]) → date
p Date.rfc3339('2001-02-03T04:05:06+07:00') #=> #<Date: 2001-02-03 ...>

# rfc822(string='Mon, 1 Jan -4712 00:00:00 +0000'[, start=Date::ITALY]) → date
p Date.rfc2822('Sat, 3 Feb 2001 00:00:00 +0000') #=> #<Date: 2001-02-03 ...>

# strptime([string='-4712-01-01'[, format='%F'[, start=Date::ITALY]]]) → date
p Date.strptime('2001-02-03', '%Y-%m-%d')   #=> #<Date: 2001-02-03 ...>
p Date.strptime('03-02-2001', '%d-%m-%Y')   #=> #<Date: 2001-02-03 ...>
p Date.strptime('2001-034', '%Y-%j')        #=> #<Date: 2001-02-03 ...>
p Date.strptime('2001-W05-6', '%G-W%V-%u')  #=> #<Date: 2001-02-03 ...>
p Date.strptime('2001 04 6', '%Y %U %w')    #=> #<Date: 2001-02-03 ...>
p Date.strptime('2001 05 6', '%Y %W %u')    #=> #<Date: 2001-02-03 ...>
p Date.strptime('sat3feb01', '%a%d%b%y')    #=> #<Date: 2001-02-03 ...>

# today([start=Date::ITALY]) → date
p Date.today   #=> #<Date: 2026-03-24 ...>

# valid_civil?(year, month, mday[, start=Date::ITALY]) → bool
p Date.valid_civil?(2001,2,3)        #=> true
p Date.valid_civil?(2001,2,29)       #=> false

# valid_commercial?(cwyear, cweek, cwday[, start=Date::ITALY]) → bool
# eturns true if the given week date is valid, and false if not.
p Date.valid_commercial?(2001,5,6)  #=> true
p Date.valid_commercial?(2001,5,8)  #=> false

# valid_date?(year, month, mday[, start=Date::ITALY]) → bool
p Date.valid_date?(2001,2,3)        #=> true
p Date.valid_date?(2001,2,29)       #=> false

# valid_jd?(jd[, start=Date::ITALY]) → bool
p Date.valid_jd?(2451944)           #=> true

# valid_ordinal?(year, yday[, start=Date::ITALY]) → bool
p Date.valid_ordinal?(2001,34)      #=> true
p Date.valid_ordinal?(2001,366)     #=> false

# xmlschema(string='-4712-01-01'[, start=Date::ITALY]) → date
p Date.xmlschema('2001-02-03')      #=> #<Date: 2001-02-03 ...>

p "============Public Instance Methods====================="

# d + other → date
p Date.new(2001,2,3) + 1    #=> #<Date: 2001-02-04 ...>
p DateTime.new(2001,2,3) + Rational(1,2) #=> #<DateTime: 2001-02-03T12:00:00+00:00 ...>
p DateTime.new(2001,2,3) + Rational(-1,2) #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
p DateTime.jd(0,12) + DateTime.new(2001,2,3).ajd #=> #<DateTime: 2001-02-03T00:00:00+00:00 ...>

# d - other → date or rational
p Date.new(2001,2,3) - 1   #=> #<Date: 2001-02-02 ...>
p DateTime.new(2001,2,3) - Rational(1,2) #=> #<DateTime: 2001-02-02T12:00:00+00:00 ...>
p Date.new(2001,2,3) - Date.new(2001) #=> (33/1)
p DateTime.new(2001,2,3) - DateTime.new(2001,2,2,12) #=> (1/2)

# d << n → date - Returns a date object pointing n months before self. The argument n should be a numeric value.
p Date.new(2001,2,3)  <<  1   #=> #<Date: 2001-01-03 ...>
p Date.new(2001,2,3)  << -2   #=> #<Date: 2001-04-03 ...>

p Date.new(2001,3,28) << 1   #=> #<Date: 2001-02-28 ...>
p Date.new(2001,3,31) << 1   #=> #<Date: 2001-02-28 ...>

p Date.new(2001,3,31) << 2         #=> #<Date: 2001-01-31 ...>
p Date.new(2001,3,31) << 1 << 1    #=> #<Date: 2001-01-28 ...>
p Date.new(2001,3,31) << 1 << -1   #=> #<Date: 2001-03-28 ...>

# d <=> other → -1, 0, +1 or nil
p Date.new(2001,2,3) <=> Date.new(2001,2,4)   #=> -1
p Date.new(2001,2,3) <=> Date.new(2001,2,3)   #=> 0
p Date.new(2001,2,3) <=> Date.new(2001,2,2)   #=> 1
p Date.new(2001,2,3) <=> Object.new           #=> nil
p Date.new(2001,2,3) <=> Rational(4903887,2)  #=> 0

# d === other → bool
p Date.new(2001,2,3) === Date.new(2001,2,3) #=> true
p Date.new(2001,2,3) === Date.new(2001,2,4) #=> false
p DateTime.new(2001,2,3) === DateTime.new(2001,2,3,12) #=> true
p DateTime.new(2001,2,3) === DateTime.new(2001,2,3,0,0,0,'+24:00') #=> true
p DateTime.new(2001,2,3) === DateTime.new(2001,2,4,0,0,0,'+24:00') #=> false

# d >> n → date
p Date.new(2001,2,3)  >>  1   #=> #<Date: 2001-03-03 ...>
p Date.new(2001,2,3)  >> -2   #=> #<Date: 2000-12-03 ...>

p Date.new(2001,1,28) >> 1   #=> #<Date: 2001-02-28 ...>
p Date.new(2001,1,31) >> 1   #=> #<Date: 2001-02-28 ...>

p Date.new(2001,1,31) >> 2         #=> #<Date: 2001-03-31 ...>
p Date.new(2001,1,31) >> 1 >> 1    #=> #<Date: 2001-03-28 ...>
p Date.new(2001,1,31) >> 1 >> -1   #=> #<Date: 2001-01-28 ...>

# ajd → rational
p DateTime.new(2001,2,3,4,5,6,'+7').ajd     #=> (11769328217/4800)
p DateTime.new(2001,2,2,14,5,6,'-7').ajd    #=> (11769328217/4800)

# amjd → rational
p DateTime.new(2001,2,3,4,5,6,'+7').amjd    #=> (249325817/4800)
p DateTime.new(2001,2,2,14,5,6,'-7').amjd   #=> (249325817/4800)

date = Date.parse('2019-01-01') 
# asctime → string
p date.asctime  # => "Tue Jan 1 00:00:00 2019"

# ctime → string
p date.ctime # => "Tue Jan 1 00:00:00 2019"

# cwday → fixnum - Returns the day of calendar week (1-7, Monday is 1).
p date.cwday => 2

# cweek → fixnum - Returns the calendar week number (1-53).
p date.cweek => 1

# cwyear → integer - Returns the calendar week based year.
p Date.new(2001,2,3).cwyear         #=> 2001
p Date.new(2000,1,1).cwyear         #=> 1999

# day → fixnum - Returns the day of the month (1-31).
p Date.new(2001,2,3).mday           #=> 3

# day_fraction → rational - Returns the fractional part of the day.
p DateTime.new(2001,2,3,12).day_fraction    #=> (1/2)

# downto(min) → enumerator
enums = Date.new(2019, 1, 5).downto(Date.new(2019, 1, 3))
p enums
Date.new(2019, 1, 5).downto(Date.new(2019, 1, 3)){ |d| puts d }

# england → date - This method is equivalent to new_start(Date::ENGLAND).
p Date.jd(Date::ENGLAND, Date::ENGLAND) # 1752-09-14

# friday? → bool
p Date.new(2000,1,1).friday? # false
p Date.new(1995,8,4).friday? # true

# gregorian → date
p Date.jd(2299161) # 1582-10-15
p Date.jd(2299160, Date::ITALY) # 1582-10-04

# gregorian? → bool
p Date.new(1582,10,15).gregorian?          #=> true
p (Date.new(1582,10,15) - 1).gregorian?    #=> false

# httpdate → string
p Date.httpdate('Sat, 03 Feb 2001 00:00:00 GMT') # 2001-02-03

# inspect → string
p Date.new(2001,2,3).inspect #=> "#<Date: 2001-02-03 ((2451944j,0s,0n),+0s,2299161j)>"
p DateTime.new(2001,2,3,4,5,6,'-7').inspect #=> "#<DateTime: 2001-02-03T04:05:06-07:00 ((2451944j,39906s,0n),-25200s,2299161j)>"

# iso8601 → string
# xmlschema → string
p Date.iso8601('2019-01-05') # 2019-01-05
p Date.xmlschema('2001-04-04T00:00:00Z') # 2001-04-04

# italy → dateclick to toggle source - This method is equivalent to new_start(Date::ITALY).
p Date.jd(Date::ITALY) # 1582-10-15

# jd → integer
p DateTime.new(2001,2,3,4,5,6,'+7').jd      #=> 2451944
p DateTime.new(2001,2,3,4,5,6,'-7').jd      #=> 2451944

# jisx0301 → string
p Date.new(2001,2,3).jisx0301       #=> "H13.02.03"

# julian → date
GREGORIAN_JDN = 2299161  # 1582-10-15 Gregorian reform
JULIAN_JDN    = 0        # 4713-11-24 BC Julian epoch  
ENGLAND_JDN   = 2361222  # 1752-09-14 England reform
ITALY_JDN     = 2298824  # 1582-10-15 Italy reform

# Working examples
puts Date.jd(GREGORIAN_JDN).strftime('%Y-%m-%d')  # => "1582-10-15"
puts Date.jd(JULIAN_JDN, JULIAN_JDN)              # => #<Date: -4713-11-24 Julian>
puts Date.jd(ENGLAND_JDN, ENGLAND_JDN)            # => #<Date: 1752-09-14>

# julian? → bool
p Date.new(1582,10,15).julian?             #=> false
p (Date.new(1582,10,15) - 1).julian?       #=> true

# ld → integer - Returns the Lilian day number. This is a whole number, which is adjusted by the offset as the local time.
p Date.new(2001,2,3).ld            #=> 152784

# leap? → bool
p Date.new(2000).leap?      #=> true
p Date.new(2001).leap?      #=> false

# mday → fixnum
p Date.new(2001,2,3).mday           #=> 3

# mjd → integer
p DateTime.new(2001,2,3,4,5,6,'+7').mjd     #=> 51943
p DateTime.new(2001,2,3,4,5,6,'-7').mjd     #=> 51943

# mon → fixnum
# month → fixnum
p Date.new(2001,2,3).mon            #=> 2
p Date.new(2001,2,3).month            #=> 2

# monday? → bool
p Date.new(2000,1,1).monday? # false
p Date.new(1995,7,31).monday? # true

# new_start([start=Date::ITALY]) → date
d = Date.new(1582,10,15)
p d.new_start(Date::JULIAN)         #=> #<Date: 1582-10-05 ...>

# next → date
d = Date.new(2001,2,3)
p d.next # 2001-02-04

# next_day([n=1]) → date
p d.next_day # 2001-02-04

# next_month([n=1]) → date
p d.next_month # 2001-03-03
p Date.new(2001-03-31).next_month # 1967-02-01

# next_year([n=1]) → date
p Date.new(2001,2,3).next_year      #=> #<Date: 2002-02-03 ...>
p Date.new(2008,2,29).next_year     #=> #<Date: 2009-02-28 ...>
p Date.new(2008,2,29).next_year(4)  #=> #<Date: 2012-02-29 ...>

# prev_day([n=1]) → date
p d.prev_day # 2001-02-02

# prev_month([n=1]) → date
p d.prev_month # 2001-01-03

# prev_year([n=1]) → date
p Date.new(2001,2,3).prev_year      #=> #<Date: 2000-02-03 ...>
p Date.new(2008,2,29).prev_year     #=> #<Date: 2007-02-28 ...>
p Date.new(2008,2,29).prev_year(4)  #=> #<Date: 2004-02-29 ...>

# rfc2822 → string
# rfc822 → string
rfc_str = "Tue, 03 Apr 2001 00:00:00 +0000"
date1 = Date.rfc2822(rfc_str)
puts date1  # => #<Date: 2001-04-03>

date2 = Date.rfc822("Sat, 05 Jan 2019 14:30:00 GMT")
puts date2  # => #<Date: 2019-01-05>

# rfc3339 → string
p Date.rfc3339('2001-02-03T04:05:06+07:00') # 2001-02-03

# saturday? → bool
p Date.new(2000,1,2).saturday? # false
p Date.new(1995,8,5).saturday? # true

# start → float
p Date.new(2001,2,3).start                  #=> 2299161.0
p Date.new(2001,2,3,Date::GREGORIAN).start  #=> -Infinity

# step(limit[, step=1]) → enumerator
# step(limit[, step=1]){|date| ...} → self
p Date.new(2001).step(Date.new(2001,-1,-1)).select{|d| d.sunday?}.size #=> 52
Date.new(2001).step(Date.new(2001,1,3)){|d| p d}

# strftime([format='%F']) → string
d = DateTime.new(2007,11,19,8,37,48,"-06:00") #=> #<DateTime: 2007-11-19T08:37:48-0600 ...>
p d.strftime("Printed on %m/%d/%Y")   #=> "Printed on 11/19/2007"
p d.strftime("at %I:%M%p")            #=> "at 08:37AM"

# succ → date
p Date.new(2001,2,3).succ # 2001-02-04

# sunday? → bool
p Date.new(2000,1,2).sunday? # true
p Date.new(1995,8,5).sunday? # false

# thursday? → bool
p Date.new(2000,1,2).thursday? # false
p Date.new(1995,8,3).thursday? # true

# to_date → self
p Date.new(2000,1,2).to_date #2000-01-02

# to_datetime → datetime
p Date.new(2000,1,2).to_datetime #2000-01-02T00:00:00+00:00

# to_s → string
p Date.new(2001,2,3).to_s  #=> "2001-02-03"

# to_time → time
p Date.new(2000,1,2).to_time #=> 2000-01-02 00:00:00 +0530

# tuesday? → bool
p Date.new(2000,1,2).tuesday? # false
p Date.new(1995,8,1).tuesday? # true

# upto(max) → enumerator
# upto(max){|date| ...} → self
p Date.new(2001).upto(Date.new(2001,-1,-1)).select{|d| d.sunday?}.size #=> 52
Date.new(2001).upto(Date.new(2001,1,3)){|d| p d}

# wday → fixnum - Returns the day of week (0-6, Sunday is zero).
p Date.new(2001,2,3).wday           #=> 6

# wednesday? → bool
p Date.new(2000,1,2).wednesday? # false
p Date.new(1995,8,2).wednesday? # true

# yday → fixnum
p Date.new(2001,2,3).yday           #=> 34

# year → integer
p Date.new(2001,2,3).year           #=> 2001
p (Date.new(1,1,1) - 1).year        #=> 0