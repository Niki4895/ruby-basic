# Ruby Program of setter method
class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website)
    @website = website
  end

  # Classical get method
  def website
    @website
  end

  # Classical set method
  def website=(website)
    @website = website
  end
end

# Creating an object of the class
csw = CSWebsite.new "www.google.com"
puts csw.website

# Change the instance variable from
# Outside the class
csw.website="www.practice.google.com"
puts csw.website

# Ruby provides us with a quick way to generate the getter and setter methods without explicitly writing them as we did in the above examples. These methods are known as accessor methods. Their purpose is the same as that of a getter or setter. There are three types of accessors in Ruby
# attr_reader : This accessor generates the automatic Getter method for the given item.
# attr_writer : This accessor generates the automatic Setter method for the given item.
# attr_accessor : This accessor generates the automatic Getter & Setter method for the given item.

# Ruby Program of accessor getter method
class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website)
    @website = website
  end

  # accessor get method
  attr_reader :website
end

# Creating an object of the class
csw = CSWebsite.new "www.google.com"
puts csw.website

# Ruby Program of accessor getter and setter method
class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website)
    @website = website
  end

  # accessor get method
  attr_reader :website

  # accessor set method
  attr_writer :website
end

# Creating an object of the class
csw = CSWebsite.new "www.google.com"
puts csw.website

# Change the instance variable from
# Outside the class
csw.website="www.practice.google.com"
puts csw.website


# Ruby Program of accessor getter and setter method
class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website)
    @website = website
  end

  # accessor get and set method
  attr_accessor :website
end

# Creating an object of the class
csw = CSWebsite.new "www.google.com"
puts csw.website

# Change the instance variable from
# Outside the class
csw.website="www.practice.google.com"
puts csw.website


# Ruby Program of accessor getter and setter method
class CSWebsite

  # Constructor to initialize
  # the class with a name
  # instance variable
  def initialize(website, id)
    @website = website
    @id = id
  end

  # accessor get and set method
  attr_accessor :website
  attr_reader :id
end

# Creating an object of the class
csw = CSWebsite.new "www.google.com", 12
puts csw.website
puts csw.id