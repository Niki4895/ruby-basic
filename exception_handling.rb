# Ruby program to illustrate the exception
 
# taking two integer value
$A = 14;
$B = 0;

# divide by zero error
# $C = $A / $B;
# puts "The Result is: #{$C}" # exception_handling.rb:8:in `/': divided by 0 (ZeroDivisionError)

# Ruby program to create the user defined exception(RAISE)

# defining a method
def raise_exception
    puts 'This is Before Exception Arise!'
    # # using raise to create exception
    # raise 'Exception Created'
    puts 'This is After Exception Arise -- Not Displayed'     
end     

# Calling the method
raise_exception
# O/P
# This is Before Exception Arise!
# exception_handling.rb:21:in `raise_exception': Exception Created (RuntimeError)

# Ruby program to create the user
# defined exception and rescued

# defining a method
def raise_and_rescue     
  begin
    puts 'This is Before Exception Arise!'

    # using raise to create an exception
    raise 'Exception Created!'

    puts 'After Exception'

  # using Rescue method
  rescue     
    puts 'Finally Saved!'
  end
  puts 'Outside from Begin Block!'
end     

# calling method
raise_and_rescue

# Ruby program to illustrate 
# use of retry statement  
begin
  # using raise to create an exception
  raise 'Exception Created! for retry'

  puts 'After Exception'
# using Rescue method
rescue
  puts 'Finally Saved! retry'
  # using retry statement  
  # retry # Note: Be careful while using retry statement because it may result into infinite loop
end

# Ruby program to illustrate 
# use of ensure statement
begin
  # using raise to create an exception  
  raise StandardError, 'Exception Created! for ensure'

  puts 'After Exception'
rescue StandardError => e
  puts "Handle Standard error: #{e.message}"

  puts e.backtrace

# using Rescue statement
rescue
  puts 'Finally Saved!'
    
# using ensure statement  
ensure
  puts 'ensure block execute'
end


# Ruby program to illustrate 
# use of else statement
begin
  # # using raise to create an exception  
  # raise 'Exception Created!'
  puts 'no Exception raise'

# using Rescue method
rescue
  puts 'Finally Saved!'

# using else statement
else
  puts 'Else block execute because of no exception raise'

# using ensure statement  
ensure
  puts 'ensure block execute'
end
