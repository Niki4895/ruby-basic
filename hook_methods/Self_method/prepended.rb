# Code as an example for prepend method
module Ruby

  def self.prepended(target)# Implementation of prepend method
    puts "#{self} has been prepended to #{target}"
  end

  def Type
    "The Type belongs to Ruby"
  end
end

class Coding
  prepend Ruby # the module Ruby is prepended
end

# Method call
puts Coding.new.Type