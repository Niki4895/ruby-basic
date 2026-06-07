# Block Methods
# each do .. end
# Yield and yield "Variable"
# BEGIN{} END{}

# Conditions
# if..end
# if..else..end
# if..elsif..else..end
# case when .. else .. end
def case_check(x)
    case x
    when 1
        p "called 1"
    when 2..9
        p "Called 2 to 9 block"
    else
        p "Else called"
    end
end
case_check(1)
case_check(5)
case_check(10)

# ternary
# unless..end
# unless..else..end

def check_unless(x)
    unless x > 10
        p "Called unless"
    else
        p "Else called"
    end
end
check_unless(1) # unless
check_unless(11) # else

# action if condition?
# action unless condition?
