# Ruby program to illustrate 
# Thread variables
 
#!/usr/bin/ruby 

# Global variable 
$str = "GeeksforGeeks" 

# first method
def Geeks1

   # only access by Geeks1 Thread
   a = 0

  while a <= 3
    puts "Geeks1: #{a}"

    # to pause the execution of the current
    # thread for the specified time
    sleep(1)

    # incrementing the value of a
    a = a + 1
  end
  # accessing str
  puts "Global variable: #$str"
end
 
# Second method
def Geeks2
  # only access by Geeks2 Thread
  b = 0
  while b <= 3
    puts "Geeks2: #{b}"

    # to pause the execution of the current
    # thread for the specified time
    sleep(0.5)

    # incrementing the value of a
    b = b + 1
  end
  # accessing str
  puts "Global variable: #$str in thread 2"
end
 
# creating thread for first method
x = Thread.new{Geeks1()}
 
# creating thread for second method
y= Thread.new{Geeks2()}
 
# using Thread.join method to 
# wait for the first thread 
# to finish
x.join
y.join
puts "Process End"

# Thread.kill(thread)

# Ruby program to illustrate 
# abort_on_exception Method

Thread.abort_on_exception = false

x = Thread.new do
  puts "Welcome to new thread"
  p Thread.current
  Thread.exit
  p "After exit"
  # raise "Exception is raised in thread"
end

sleep(0.5)
puts "Not Found"

# DEPRECATED

# WARNING: Only works in Ruby 1.8

# counter = 0

# t1 = Thread.new do
#   Thread.critical = true
#   5.times do
#     counter += 1
#     puts "Thread 1: #{counter}"
#     sleep 0.1
#   end
#   Thread.critical = false
# end

# t2 = Thread.new do
#   Thread.critical = true
#   5.times do
#     counter += 1
#     puts "Thread 2: #{counter}"
#     sleep 0.1
#   end
#   Thread.critical = false
# end

# t1.join
# t2.join

t = Thread.fork do
  3.times do |i|
    puts "Hello from thread: #{i}"
    sleep 1
  end
end

puts "Hello from main thread"

t.join


# Ruby program to illustrate 
# kill Method

counter = 0

# creating new thread
x = Thread.new { loop { counter += 1 } }

# using sleep method
sleep(0.4)           

# exits the thread using kill method
Thread.kill(x)    

# give it time to die!
sleep(0.5)

# return false
x.alive?

p "------------------------------"
# Ruby program to illustrate 
# list Method

# first thread
Thread.new { sleep(100) }

# second thread
Thread.new { 10000.times {|z| z*z } }

# third thread
Thread.new { Thread.stop }

# using list method
Thread.list.each {|thr| p thr }

# Ruby program to print the id 
# of main thread
 
# using the main method
puts Thread.main

x = Thread.new { print "geeks"; print "geeksforgeeks" }
# using pass method
Thread.pass
print "geeksforgeeks"
x.run
x.join

t = Thread.start(10, 20) do |a, b|
  puts "Sum: #{a + b}"
end

t.join

threads = []

3.times do |i|
  threads << Thread.start(i) do |number|
    puts "Thread #{number} running"
    # Thread.stop
    sleep 1
  end
end

threads.each(&:join)

counter = 0
x = Thread.new { loop { counter += 1 } }
puts x.alive?

# States	Return Value
# Runnable	run
# Sleeping	sleep
# Aborting	aborting
# Terminated normally	false
# Terminated with exception	nil

# Ruby program to illustrate 
# main thread

# Create main thread
puts Thread.main  
puts ""  

# create new thread 
a1 = Thread.new {sleep 200}  
list_thread= Thread.list
list_thread.each {|t| p t }  
puts "Current thread = " + Thread.current.to_s  

 # create new thread
a2 = Thread.new {sleep 200}  
list_thread= Thread.list
list_thread.each {|t| p t }  
puts "Current thread=" + Thread.current.to_s   

 # kill thread a1
Thread.kill(a1) 

# pass execution to thread a2 
Thread.pass   

# kill thread a2                         
Thread.kill(a2)          

list_thread= Thread.list
list_thread.each {|t| p t }  
  
# exit main thread
Thread.exit
# Alternate Thread States: Pausing, Waking, and Killing
