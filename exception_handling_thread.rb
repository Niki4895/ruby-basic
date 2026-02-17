# Ruby program to illustrate 
# the exception in thread

#!/usr/bin/ruby  

# threads = []
# 4.times do |value|
#   threads << Thread.new(value) do |a|
#     # raising an error when a become 2
#     raise "oops error!" if a == 2
#     print "#{a}\n"
#   end
# end
# threads.each {|b| b.join }
# <Thread:0x000063571ca68d18 exceptional_handling_thread.rb:9 run> terminated with exception (report_on_exception is true)


# Ruby program to illustrate how to 
# escape the exception

#!/usr/bin/ruby  
# abort_on_exception= true(default), it kills the thread which contains an exception. Once the thread is dead, no more output will produce. 

threads = []

Thread.report_on_exception = false

5.times do |value|
  threads << Thread.new(value) do |a|
    # Thread.current.report_on_exception = false
    raise "oops error!" if a == 3
    print "#{a}\n"
  end
end

threads.each do |x|
  begin
    x.join
  # using rescue method
  rescue RuntimeError => y
    puts "Failed:: #{y.message}"
  end
end
