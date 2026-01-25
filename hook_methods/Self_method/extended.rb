# Code as  an example for extend method
module Ruby

  def self.extended(target)
    puts "#{self} was extended by #{target}"
  end

  def Type
    "The Type is Ruby"
  end
end

class Coding
  extend Ruby # Extending the module Ruby
end

# Method calling
puts Coding.Type