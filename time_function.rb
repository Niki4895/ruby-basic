p Time.new(2002)         #=> 2002-01-01 00:00:00 -0500
p Time.new(2002, 10)     #=> 2002-10-01 00:00:00 -0500
p Time.new(2002, 10, 31) #=> 2002-10-31 00:00:00 -0500
p Time.new(2002, 10, 31, 2, 2, 2, "+02:00") #=> 2002-10-31 02:02:02 +0200

# p Time.new(2002, 10, 31, 2, 2, 2, "Europe/Athens") #=> 2002-10-31 02:02:02 +0200

p Time.at(628232400) #=> 1989-11-28 00:00:00 -0500

t = Time.new(1993, 02, 24, 12, 0, 0, "+09:00")

p t.monday? #=> false
p t.year #=> 1993
p t.dst? #=> false
p t + (60*60*24*365) #=> 1994-02-24 12:00:00 +0900
p t.to_i #=> 730522800

t1 = Time.new(2010)
t2 = Time.new(2011)

p t1 == t2 #=> false
p t1 == t1 #=> true
p t1 <  t2 #=> true
p t1 >  t2 #=> false

p Time.new(2010,10,31).between?(t1, t2) #=> true

p "===============Public Class Methods===================="

=begin
at(time) → time
at(seconds_with_frac) → time
at(seconds, microseconds_with_frac) → time
at(seconds, milliseconds, :millisecond) → time
at(seconds, microseconds, :usec) → time
at(seconds, microseconds, :microsecond) → time
at(seconds, nanoseconds, :nsec) → time
at(seconds, nanoseconds, :nanosecond) → time
at(time, in: tz) → time
at(seconds_with_frac, in: tz) → time
at(seconds, microseconds_with_frac, in: tz) → time
at(seconds, milliseconds, :millisecond, in: tz) → time
at(seconds, microseconds, :usec, in: tz) → time
at(seconds, microseconds, :microsecond, in: tz) → time
at(seconds, nanoseconds, :nsec, in: tz) → time
at(seconds, nanoseconds, :nanosecond, in: tz) → time
=end

p Time.at(0)                                #=> 1969-12-31 18:00:00 -0600
p Time.at(Time.at(0))                       #=> 1969-12-31 18:00:00 -0600
p Time.at(946702800)                        #=> 1999-12-31 23:00:00 -0600
p Time.at(-284061600)                       #=> 1960-12-31 00:00:00 -0600
p Time.at(946684800.2).usec                 #=> 200000
p Time.at(946684800, 123456.789).nsec       #=> 123456789
p Time.at(946684800, 123456789, :nsec).nsec #=> 123456789

=begin
gm(year) → time
gm(year, month) → time
gm(year, month, day) → time
gm(year, month, day, hour) → time
gm(year, month, day, hour, min) → time
gm(year, month, day, hour, min, sec_with_frac) → time
gm(year, month, day, hour, min, sec, usec_with_frac) → time
gm(sec, min, hour, day, month, year, dummy, dummy, dummy, dummy) → time
=end

p Time.utc(2000,"jan",1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
p Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC

=begin
local(year) → time
local(year, month) → time
local(year, month, day) → time
local(year, month, day, hour) → time
local(year, month, day, hour, min) → time
local(year, month, day, hour, min, sec_with_frac) → time
local(year, month, day, hour, min, sec, usec_with_frac) → time
local(sec, min, hour, day, month, year, dummy, dummy, isdst, dummy) → time
=end
p Time.local(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 -0600

=begin
mktime(year) → time
mktime(year, month) → time
mktime(year, month, day) → time
mktime(year, month, day, hour) → time
mktime(year, month, day, hour, min) → time
mktime(year, month, day, hour, min, sec_with_frac) → time
mktime(year, month, day, hour, min, sec, usec_with_frac) → time
mktime(sec, min, hour, day, month, year, dummy, dummy, isdst, dummy) → time
=end
p Time.local(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 -0600
p Time.mktime(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 -0600

# new → time
# new(year, month=nil, day=nil, hour=nil, min=nil, sec=nil, tz=nil) → time

a = Time.new      #=> 2007-11-19 07:50:02 -0600
b = Time.new      #=> 2007-11-19 07:50:02 -0600
a == b            #=> false
"%.6f" % a.to_f   #=> "1195480202.282373"
"%.6f" % b.to_f   #=> "1195480202.283415"

Time.new(2008,6,21, 13,30,0, "+09:00") #=> 2008-06-21 13:30:00 +0900

# A trip for RubyConf 2007
p t1 = Time.new(2007,11,1,15,25,0, "+09:00") # JST (Narita)
p t2 = Time.new(2007,11,1,12, 5,0, "-05:00") # CDT (Minneapolis)
p t3 = Time.new(2007,11,1,13,25,0, "-05:00") # CDT (Minneapolis)
p t4 = Time.new(2007,11,1,16,53,0, "-04:00") # EDT (Charlotte)
p t5 = Time.new(2007,11,5, 9,24,0, "-05:00") # EST (Charlotte)
p t6 = Time.new(2007,11,5,11,21,0, "-05:00") # EST (Detroit)
p t7 = Time.new(2007,11,5,13,45,0, "-05:00") # EST (Detroit)
p t8 = Time.new(2007,11,6,17,10,0, "+09:00") # JST (Narita)
p (t2-t1)/3600.0                             #=> 10.666666666666666
p (t4-t3)/3600.0                             #=> 2.466666666666667
p (t6-t5)/3600.0                             #=> 1.95
p (t8-t7)/3600.0                             #=> 13.416666666666666

# now → time
p Time.now            #=> 2026-03-25 22:26:29.16978747 +0530

=begin
utc(year) → time
utc(year, month) → time
utc(year, month, day) → time
utc(year, month, day, hour) → time
utc(year, month, day, hour, min) → time
utc(year, month, day, hour, min, sec_with_frac) → time
utc(year, month, day, hour, min, sec, usec_with_frac) → time
utc(sec, min, hour, day, month, year, dummy, dummy, dummy, dummy) → time
=end

p Time.utc(2000,"jan",1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
p Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC

p "=========================Public Instance Methods========================"

# time + numeric → time
p t = Time.now         #=> 2026-03-25 22:27:43.67228948 +0530
p t + (60 * 60 * 24)   #=> 2026-03-26 22:27:43.67228948 +0530

# time - other_time → float
# time - numeric → time
p t = Time.now       #=> 2026-03-25 22:28:26.764702568 +0530
p t2 = t + 2592000   #=> 2026-04-24 22:28:26.764702568 +0530
p t2 - t             #=> 2592000.0
p t2 - 2592000       #=> 2026-03-25 22:28:26.764702568 +0530

# time <=> other_time → -1, 0, +1, or nil
p t = Time.now       #=> 2026-03-25 22:33:34.627377443 +0530
p t2 = t + 2592000   #=> 2026-04-24 22:33:34.627377443 +0530
p t <=> t2           #=> -1
p t2 <=> t           #=> 1

p t = Time.now       #=> 2026-03-25 22:33:34.627396665 +0530
p t2 = t + 0.1       #=> 2026-03-25 22:33:34 10237197967014192296237/14073748835532800000000 +0530
p t.nsec             #=> 627396665
p t2.nsec            #=> 727396665
p t <=> t2           #=> -1
p t2 <=> t           #=> 1
p t <=> t            #=> 0

# asctime → string
# ctime → string
p Time.now.asctime   #=> "Wed Mar 25 22:35:10 2026"
p Time.now.ctime     #=> "Wed Mar 25 22:35:10 2026"

# day → integer
p t = Time.now   #=> 2026-03-25 22:36:01.271308425 +0530
p t.day          #=> 25
p t.mday         #=> 25

# dst? → true or false - Returns true if time occurs during Daylight Saving Time in its time zone.

# IST:
p Time.local(2000, 1, 1).zone    #=> "IST"
p Time.local(2000, 1, 1).isdst   #=> false
p Time.local(2000, 1, 1).dst?    #=> false

# eql?(other_time)
t1 = Time.local(2000, 1, 1)
t2 = Time.local(2000, 1, 2)
t3 = Time.local(2000, 1, 1)
p t1.eql?(t2) #=> false
p t1.eql?(t3) #=> true

# friday? → true or false
p t = Time.local(1987, 12, 18)     #=> 1987-12-18 00:00:00 -0600
p t.friday?                        #=> true

# getgm → new_time
p t = Time.local(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 -0600
p t.gmt?                             #=> false
p y = t.getgm                        #=> 2000-01-02 02:15:01 UTC
p y.gmt?                             #=> true
p t == y                             #=> true

# getlocal → new_time
# getlocal(utc_offset) → new_time
# getlocal(timezone) → new_time
p t = Time.utc(2000,1,1,20,15,1)  #=> 2000-01-01 20:15:01 UTC
p t.utc?                          #=> true

p l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
p l.utc?                          #=> false
p t == l                          #=> true

p j = t.getlocal("+09:00")        #=> 2000-01-02 05:15:01 +0900
p j.utc?                          #=> false
p t == j                          #=> true

p k = t.getlocal(9*60*60)         #=> 2000-01-02 05:15:01 +0900
p k.utc?                          #=> false
p t == k                          #=> true

# getutc → new_time
p t = Time.local(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 -0600
p t.gmt?                             #=> false
p y = t.getgm                        #=> 2000-01-02 02:15:01 UTC
p y.gmt?                             #=> true
p t == y                             #=> true

# gmt? → true or false
p t = Time.now                        #=> 2026-03-25 22:41:16.425958245 +0530
p t.utc?                              #=> false
p t = Time.gm(2000,"jan",1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
p t.utc?                              #=> true

p t = Time.now                        #=> 2026-03-25 22:41:16.425975579 +0530
p t.gmt?                              #=> false
p t = Time.gm(2000,1,1,20,15,1)       #=> 2000-01-01 20:15:01 UTC
p t.gmt?                              #=> true

# gmt_offset → integer
p t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
p t.gmt_offset                    #=> 0
p l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
p l.gmt_offset                    #=> 19800

# gmtime → time
p t = Time.now   #=> 2026-03-25 22:43:02.441137616 +0530
p t.gmt?         #=> false
p t.gmtime       #=> 2026-03-25 17:13:02.441137616 UTC
p t.gmt?         #=> true

p t = Time.now   #=> 2026-03-25 22:43:02.441178801 +0530
p t.utc?         #=> false
p t.utc          #=> 2026-03-25 17:13:02.441178801 UTC
p t.utc?         #=> true

# gmtoff → integer
p t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
p t.gmt_offset                    #=> 0
p l = t.getlocal                  #=> 2000-01-01 14:15:01 -0600
p l.gmt_offset                    #=> 19800

# hash -> integer
h = {user: "nikita", tz: "Europe/Athens"}
p ts = h.hash    # => Unique Fixnum/Integer (e.g., -1234567890) # -3390890055806601198
p time = Time.at(ts) # -107453026314-03-13 11:20:10 +0553
puts time # -107453026314-03-13 11:20:10 +0553

# hour → integer
p t = Time.now   #=> 2026-03-25 22:48:31.673558322 +0530
p t.hour         #=> 22

# inspect → string

t = Time.now
p t.to_s                              #=> "2026-03-25 22:49:06 +0530"
p t.strftime "%Y-%m-%d %H:%M:%S %z"   #=> "2026-03-25 22:49:06 +0530"

p t.utc.to_s                          #=> "2026-03-25 17:19:06 UTC"
p t.strftime "%Y-%m-%d %H:%M:%S UTC"  #=> "2026-03-25 17:19:06 UTC"

# isdst → true or false
p Time.local(2000, 1, 1).zone    #=> "IST"
p Time.local(2000, 1, 1).isdst   #=> false
p Time.local(2000, 1, 1).dst?    #=> false

# localtime → time
# localtime(utc_offset) → time
p t = Time.utc(2000, "jan", 1, 20, 15, 1) #=> 2000-01-01 20:15:01 UTC
p t.utc?                                  #=> true

p t.localtime                             #=> 2000-01-02 01:45:01 +0530
p t.utc?                                  #=> false

p t.localtime("+09:00")                   #=> 2000-01-02 05:15:01 +0900
p t.utc?                                  #=> false

# mday → integer # Returns the day of the month (1..n) for time.
p t = Time.now   #=> 2026-03-25 22:51:37.659258704 +0530
p t.day          #=> 25
p t.mday         #=> 25

# min → integer
p t = Time.now   #=> 2026-03-25 22:52:10.230751824 +0530
p t.min          #=> 52

# mon → integer
# month → integer
p t = Time.now   #=> 22026-03-25 22:52:56.485345536 +0530
p t.mon          #=> 3
p t.month        #=> 3

# monday? → true or false
p t = Time.local(2003, 8, 4)       #=> 2003-08-04 00:00:00 -0500
p t.monday?                        #=> true

# nsec → int - Returns the number of nanoseconds for time.
p t = Time.now        #=> 2026-03-25 22:54:03.661174005 +0530
p "%10.9f" % t.to_f   #=> "1774459443.661174059"
p t.nsec              #=> 661174005

# round([ndigits]) → new_time - Rounds sub seconds to a given precision in decimal digits (0 digits by default). It returns a new Time object. ndigits should be zero or a positive integer.
require 'time'

t = Time.utc(2010,3,30, 5,43,"25.123456789".to_r)
p t.iso8601(10)           #=> "2010-03-30T05:43:25.1234567890Z"
p t.round.iso8601(10)     #=> "2010-03-30T05:43:25.0000000000Z"
p t.round(0).iso8601(10)  #=> "2010-03-30T05:43:25.0000000000Z"
p t.round(1).iso8601(10)  #=> "2010-03-30T05:43:25.1000000000Z"
p t.round(2).iso8601(10)  #=> "2010-03-30T05:43:25.1200000000Z"
p t.round(3).iso8601(10)  #=> "2010-03-30T05:43:25.1230000000Z"
p t.round(4).iso8601(10)  #=> "2010-03-30T05:43:25.1235000000Z"
p t.round(5).iso8601(10)  #=> "2010-03-30T05:43:25.1234600000Z"
p t.round(6).iso8601(10)  #=> "2010-03-30T05:43:25.1234570000Z"
p t.round(7).iso8601(10)  #=> "2010-03-30T05:43:25.1234568000Z"
p t.round(8).iso8601(10)  #=> "2010-03-30T05:43:25.1234567900Z"
p t.round(9).iso8601(10)  #=> "2010-03-30T05:43:25.1234567890Z"
p t.round(10).iso8601(10) #=> "2010-03-30T05:43:25.1234567890Z"

t = Time.utc(1999,12,31, 23,59,59)
p (t + 0.4).round.iso8601(3)    #=> "1999-12-31T23:59:59.000Z"
p (t + 0.49).round.iso8601(3)   #=> "1999-12-31T23:59:59.000Z"
p (t + 0.5).round.iso8601(3)    #=> "2000-01-01T00:00:00.000Z"
p (t + 1.4).round.iso8601(3)    #=> "2000-01-01T00:00:00.000Z"
p (t + 1.49).round.iso8601(3)   #=> "2000-01-01T00:00:00.000Z"
p (t + 1.5).round.iso8601(3)    #=> "2000-01-01T00:00:01.000Z"

t = Time.utc(1999,12,31, 23,59,59)
p (t + 0.123456789).round(4).iso8601(6)  #=> "1999-12-31T23:59:59.123500Z"

# saturday? → true or false
p t = Time.local(2006, 6, 10)      #=> 2006-06-10 00:00:00 -0500
p t.saturday?                      #=> true

# sec → integer
p t = Time.now   #=> 2026-03-25 22:56:57.351630487 +0530
p t.sec          #=> 57

# strftime( string ) → string
p t = Time.new(2007,11,19,8,37,48,"-06:00") #=> 2007-11-19 08:37:48 -0600
p t.strftime("Printed on %m/%d/%Y")         #=> "Printed on 11/19/2007"
p t.strftime("at %I:%M %p")                 #=> "at 08:37 AM"

# subsec → number
p t = Time.now        #=> 2026-03-25 22:57:57.714725225 +0530
p "%10.9f" % t.to_f   #=> "1774459677.714725018"
p t.subsec            #=> (28589009/40000000)

# succ → new_time
p t = Time.now       #=> 2026-03-25 22:59:26.521874185 +0530
# p t.succ             #=> 2026-03-25 22:59:56.120270991 +0530
p t + 1 # 2026-03-25 22:59:56.120270991 +0530

# sunday? → true or false
p t = Time.local(1990, 4, 1)       #=> 1990-04-01 00:00:00 -0600
p t.sunday?                        #=> true

# thursday? → true or false
p t = Time.local(1995, 12, 21)     #=> 1995-12-21 00:00:00 -0600
p t.thursday?                      #=> true

# to_a → array
# [sec, min, hour, day, month, year, wday, yday, isdst, zone]
p t = Time.now     #=> 2026-03-25 23:01:36.381726457 +0530
p now = t.to_a     #=> [36, 1, 23, 25, 3, 2026, 3, 84, false, "IST"]

# to_f → float
# to_i → int
p t = Time.now # 2026-03-25 23:02:31.598016456 +0530
p "%10.5f" % t.to_f   #=> "1774459951.59802"
p t.to_i              #=> 1774459951

# to_r → a_rational
p t = Time.now # 2026-03-25 23:03:20.765836379 +0530
p t.to_r            #=> (1774460000765836379/1000000000)

# to_s → string
t = Time.now
p t.to_s                              #=> "2026-03-25 23:04:02 +0530"
p t.strftime "%Y-%m-%d %H:%M:%S %z"   #=> "2026-03-25 23:04:02 +0530"

p t.utc.to_s                          #=> "2026-03-25 17:34:02 UTC"
p t.strftime "%Y-%m-%d %H:%M:%S UTC"  #=> "2026-03-25 17:34:02 UTC"

# tuesday? → true or false
p t = Time.local(1991, 2, 19)      #=> 1991-02-19 00:00:00 -0600
p t.tuesday?                       #=> true

# tv_nsec → int
p t = Time.now        #=> 2026-03-25 23:05:11.571963327 +0530
p "%10.9f" % t.to_f   #=> "1774460111.571963310"
p t.nsec              #=> 571963327

# tv_sec → int
p t = Time.now # 2026-03-25 23:06:08.181246851 +0530
p "%10.5f" % t.to_f   #=> "1774460168.18125"
p t.to_i              #=> 1774460168

# tv_usec → int
# usec → int
p t = Time.now        #=> 2026-03-25 23:06:53.406877755 +0530
p "%10.6f" % t.to_f   #=> "1774460213.406878"
p t.usec              #=> 406877

# gmtime → time
# utc → time
p t = Time.now   #=> 2026-03-25 23:08:11.489500141 +0530
p t.gmt?         #=> false
p t.gmtime       #=> 2026-03-25 17:38:11.489500141 UTC
p t.gmt?         #=> true

p t = Time.now   #=> 2026-03-25 23:08:11.4895416 +0530
p t.utc?         #=> false
p t.utc          #=> 2026-03-25 17:38:11.4895416 UTC
p t.utc?         #=> true

# utc_offset → integer
p t = Time.gm(2000,1,1,20,15,1)   #=> 2000-01-01 20:15:01 UTC
p t.gmt_offset                    #=> 0
p l = t.getlocal                  #=> 22000-01-02 01:45:01 +0530
p l.gmt_offset                    #=> 19800

# wday → integer
p t = Time.now   #=> 2026-03-25 23:10:25.312667638 +0530
p t.wday         #=> 3
p t.sunday?      #=> false
p t.monday?      #=> false
p t.tuesday?     #=> false
p t.wednesday?   #=> true
p t.thursday?    #=> false
p t.friday?      #=> false
p t.saturday?    #=> false

# wednesday? → true or false
p t = Time.local(1993, 2, 24)      #=> 1993-02-24 00:00:00 -0600
p t.wednesday?                     #=> true

# yday → integer
p t = Time.now   #=> 2026-03-25 23:11:27.099730718 +0530
p t.yday         #=> 84

# year → integer
p t = Time.now   #=> 2026-03-25 23:12:02.900287171 +0530
p t.year         #=> 2026

# zone → string or timezone
t = Time.gm(2000, "jan", 1, 20, 15, 1)
p t.zone   #=> "UTC"
t = Time.local(2000, "jan", 1, 20, 15, 1)
p t.zone   #=> "IST"

p Time.at(1234).strftime "%M:%S" # 50:34