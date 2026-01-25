require_relative 'Greetings'

class Person
  include Greetings # implementation of the include statement
end

Person.new.show_person_to_be_greeted('Test Include')