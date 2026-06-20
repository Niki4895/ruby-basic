def Greek1; end
def Geeks2; end
x = Thread.new{Geeks1()}
y= Thread.new{Geeks2()}
x.join
y.join
puts "Process End"
# Thread.kill(thread)
# abort_on_exception
# Thread.fork
# x.alive?
# Thread.list
# Thread.main
# Thread.pass
# Thread.start(i)
# Thread.stop
# Thread.current
# Thread.exit

p "=================EXCEPTION HANDLING IN THREAD=============="
# Thread.report_on_exception
# threads << Thread.new(value)
# threads.each do |x|
#   begin
#     x.join
#   # using rescue method
#   rescue RuntimeError => y
#     puts "Failed:: #{y.message}"
#   end
# end