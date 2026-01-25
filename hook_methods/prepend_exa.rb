#Prepended method provides another way of extending the functioning of modules at different places.
#This uses the concept of overriding. The modules can be overridden using methods defined in the target class. 
require_relative 'Greetings'

class Person
  prepend Greetings # the module Ruby is prepended
end

Person.new.show_person_to_be_greeted('Test Prepend')