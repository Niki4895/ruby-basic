
# Ruby program to illustrate unless statement  
  
# variable a 
a = 1
  
unless a > 4
      
    # this will print as 
    # condition is false 
    puts "Welcome!"
  
else
    puts "Hello!"
      
end


# variable b 
b = 0
  
# unless is behave as a modifier 
# here 'b += 2 ' is the statement 
# b.zero? is the condition 
b += 2 unless b.zero?
puts(b)
b += 2 unless a.zero? 
puts(b)

# if .. end
# statement if condition
# if .. else ... end
# if .. elsif... else.. end

a = 78 
if a  < 50  
  puts "Student is failed" 
  
elsif a >= 50 && a <= 60  
  puts "Student gets D grade" 
  
elsif a >= 70 && a <= 80  
  puts "Student gets B grade"
   
elsif a >= 80 && a <= 90  
  puts "Student gets A grade"
    
elsif a >= 90 && a <= 100  
  puts "Student gets A+ grade"   
end

# ternary
a = (var > 2) ? true : false 