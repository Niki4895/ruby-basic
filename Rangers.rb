# using start_point..end_point 
# to_a is used to convert it  
# into array 
ranges = (7 .. 10).to_a 
   
# displaying result 
puts "#{ranges}"
   
# using start_point...end_point 
# to_a is used to convert it  
# into array 
range_op1 = (7 ... 10).to_a 
   
# displaying result 
puts "#{range_op1}"

puts ranges.include?(8) # include with range

p ranges.max # print max from range

print ranges.min # print min from range

ranges.each do |digit|    
    puts "In Loop #{digit}"   
end


 # given number 
num = 4152  
    
result = case num    
   when 1000..2000 then "Lies Between 1000 and 2000"   
   when 2000..3000 then "Lies Between 2000 and 3000"
   when 4000..5000 then "Lies Between 4000 and 5000" 
   when 6000..7000 then "Lies Between 6000 and 7000" 
         
   else "Above 7000"   
end   
    
puts result    

p  (('A'..'Z') === 'D')
p ((1..100) === 77)

puts ('Z'..'W').to_a # it will not work
# print given range in the reverse order 
puts ('W'..'Z').to_a.reverse


#BOOLEAN AND NIL

# Demo for Boolean literals 
puts(3+7==10);# returns true 
puts(3+7!=10);# returns false 
puts(3+7==nil);# return false 

#Numbers or Integers 

puts("300+1_00+10_0=", 300+1_00+10_0 ); 
puts("hexa-", 0xaa ); 
puts("octal-", 0o222 ); 
puts("decimal-", 0d170, " ", 170); 
puts("binary-", 0b1010); 
puts("Float-", 1.234E1); 
# puts("hexa-", aa);# error 


f = Dir.mkdir "abc"

Dir.exist? "abc"
Dir.empty?"abc"

obj= Dir.new("abc")
p obj.path 
Dir.entries("abc")
p Dir.pwd # current directory

p Dir.home

p Dir.home('nikita')
d=Dir.new("abc")
p d.path

p Dir.glob("*")
# FileUtils.mkdir_p 'abc/test'
# FileUtils.mv("source", "destination")
# FileUtils.cp("source", "destination")


Dir.delete "abc"
# Dir.rmdir "abc"
# Dir.unlink "abc"

