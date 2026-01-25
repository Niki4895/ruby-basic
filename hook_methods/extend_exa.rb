require_relative 'Greetings'

class Person
  extend Greetings # the module Ruby is extended
end

Person.show_person_to_be_greeted('Test extend')