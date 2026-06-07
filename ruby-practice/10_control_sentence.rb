for t in 0...10
  if t == 5 then 
    next
  end
  puts t
end
# skip 5 and print other numberes

def check_break
    i = 1
    while true   
        if i * 6 >= 30
            break
        end   
        puts i * 6   
        i += 1
    end
    p "after break printing"
end
check_break

def check_redo
    val = 0
    while(val < 4)  
        puts val 
        val += 1
        redo if val == 4
    end
    p "After redo printing #{val}"
end
# Even if we have a condition to print if val < 4 but because of redo it will exeute block
check_redo

def check_retry
    var = 3
    begin
        var.times do |v|
            puts "Value of local variable is #{v}"
            if v == 2
                var -= 1
                raise "too big"
            end
        end
    rescue
        retry
    end
end
# Here we have retry after updating val from 3 to 2 which won't break again
# If we don't update the value then it will go in infinite loop
check_retry

def check_return
    i = 0
    while i < 4
        return i if i == 2
        p i
        i += 1
    end
    p "after return prining"
end
# this will retun from the method with passed value default nil and not printing next statement 
p check_return

def lessNumber(num)
    p num 
  # using throw statement 
  # here 'numberError' is its label 
  throw :numberError if num < 10
  puts "Number is Greater than 10! #{num}"
end

catch :numberError do
    p "Enter number"
    number = gets.to_i
    p number
    lessNumber(number)
    # p "Enter number"
    # n2 = gets.to_i
    # lessNumber(n2)
end
# this will execute the methods in catch block and handle throw error

# Cateh throw exception
gfg = catch(:divide) do
  # a code block of catch similar to begin
  number = gets.to_i

  throw :divide if number == 0

  number
  # no exception is thrown
end
puts gfg