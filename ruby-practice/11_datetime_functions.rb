# Date Functions
# Need to require 'date' to access its methods. Which provide methods for date and datetime

# Calendar Date - The calendar date is a particular day of a calendar year, identified by its ordinal number within a calendar month within that year.(civil)
# Ordinal Date - The ordinal date is a particular day of a calendar year identified by its ordinal number within the year.
# Julian Day Number - The Julian day number is in elapsed days since noon (Greenwich Mean Time) on January 1, 4713 BCE (in the Julian calendar).
# Modified Julian Day Number - The modified Julian day number is in elapsed days since midnight (Coordinated Universal Time) on November 17, 1858 CE (in the Gregorian calendar).

# ENGLAND
# The Julian day number of the day of calendar reform for England and her colonies.

# GREGORIAN
# The Julian day number of the day of calendar reform for the proleptic Gregorian calendar.

# ITALY
# The Julian day number of the day of calendar reform for Italy and some catholic countries.

# JULIAN
# The Julian day number of the day of calendar reform for the proleptic Julian calendar.

# different method to get date object
# _httpdate
# _iso8601
# _jisx0301
# _parse
# _rfc2822
# _rfc3339
# _rfc822
# _strptime
# _xmlschema

# civil Date.new
# gregorian_leap?
# julian_leap?
# leap?

# valid_civil?
# valid_commercial?
# valid_date?
# valid_jd?
# valid_ordinal?

# httpdate
# iso8601
# jd
# jisx0301
# rfc2822
# rfc3339
# rfc822
# xmlschema
# ordinal
# commercial
# parse
# strptime

# new
# today

# rational
DateTime.new(2001,2,3) + Rational(1, 4)
#<DateTime: 2001-02-03T06:00:00+00:00 ((2451944j,21600s,0n),+0s,2299161j)> 
DateTime.new(2001,2,3) + Rational(1, 5)
#<DateTime: 2001-02-03T04:48:00+00:00 ((2451944j,17280s,0n),+0s,2299161j)> 
DateTime.new(2001,2,3) + Rational(1)
#<DateTime: 2001-02-04T00:00:00+00:00 ((2451945j,0s,0n),+0s,2299161j)> 
DateTime.new(2001,2,3) + Rational(2)
#<DateTime: 2001-02-05T00:00:00+00:00 ((2451946j,0s,0n),+0s,2299161j)> 

# d + other → date
# d - other → date or rational
p Date.new(2001,2,3) - Date.new(2001) # Rational
# d << n → date - Deduct month and if last date is less then set last date of that month
# d <=> other → -1, 0, +1 or nil - compare and result in number
#  d === other → bool - compare and result in bool
# d >> n → date - Add month


# ajd → rational- Datetime function
# amjd → rational - Datetime function

# asctime 
# ctime
# cwday -  returns the day of calendar week (1-7, Monday is 1).
# cweek - Returns the calendar week number (1-53).
# cwyear - Returns the calendar week based year.
# mday - day of the month
# day - date
# mon, month - Month in the date
# next, next_day, succ -> next day of that date
# next_month
# next_year
# prev_day
# prev_month
# prev_year
# start -> start based on passed time like Date::ENGLAND
# wday -> Returns the day of week (0-6, Sunday is zero).
# yday -> date in the year
# year

# day_fraction - fraction of the day based on time
# downto(min)  => enums
# step => enumerator
# upto(max) → enumerator

# check the day on that date
# monday?
# tuesday?
# wednesday?
# thursday?
# friday?
# saturday?
# sunday?


# england - Date::ENGLAND
# jd - Date::ITALY
# gregorian - jd
# jisx0301
# ld => lilian day -> .ld
# mjd -> .mjd
# new_start - > new_start(Date::JULIAN)
# 
# julian → date
# GREGORIAN_JDN = 2299161  # 1582-10-15 Gregorian reform
# JULIAN_JDN    = 0        # 4713-11-24 BC Julian epoch  
# ENGLAND_JDN   = 2361222  # 1752-09-14 England reform
# ITALY_JDN     = 2298824  # 1582-10-15 Italy reform
# Date.jd

# inspect
# strftime
# to_date
# to_datetime
# to_s
# to_time

# gregorian?
# julian?

p "============================TIME FUNCTIONS=============="
# Time.new(year, month, date, hour, sec, msec, timezone)
# Time.new().to_i -> num
# Time.at(num, in: tz) -> time

# new
# at
# gm(), utc() -> UTC time 
# local, mktime -> current timezone time

# time + numeric
# time - other_time
# time <=> other_time

# asctime, ctime
# day, mday, hour
# min -> minute
# mon, month
# nsec -> neno sec
# sec
# subsec
# tv_nsec
# tv_sec
# tv_usec, usec
# succ
# wday, yday, year

# inspect
# strftime

# eql?
# gmt?, utc?  
# dst? - Returns true if time occurs during Daylight Saving Time in its time zone.
# zone
# isdst -> Daylight saving or not
# getgm - Convert time in UTC
# getlocal(timezone)
# gmt_offset, gmtoff, utc_offset
# utc, gmtime
# hash
# localtime(tzs)
# round -> round nano second
# iso8601 -> format

# check the day on that date
# monday?
# tuesday?
# wednesday?
# thursday?
# friday?
# saturday?
# sunday?

# to_a
# to_r -> Rational number
# to_f
# to_i
# to_s

p "==========================DATETIME FUNCTION==========================="

# now, new() -> civil
# commercial
# httpdate
# iso8601()
# jd
# jisx0301
# ordinal
# rfc2822
# rfc3339
# rfc822
# xmlschema
# parse

# hour
# min, minute
# sec
# offset
# zone
# Rational()
# new_offset()
# sec, second
# sec_fraction, second_fraction
# strftime()
# gregorian
# strptime

# datetime + numeric
# datetime - other_time
# datetime <=> other_time

# to_s
# to_date
# to_datetime
# to_time
