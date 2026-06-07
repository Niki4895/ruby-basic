# Module calling without extend or importing
module TestModule
    A = 10;
   
    def self.portal
        puts "Welcome to Git Portal!"
    end
      
    def TestModule.demo  
        puts "Ruby"
    end
end

p TestModule::A
TestModule::demo
TestModule::portal

# Ruby program to illustrate how 
# to use module inside a class
 
# Creating a module with name Gfg
module UserDetail
    def name
        puts "Nikita" 
    end

    def age  
        puts "Age is 30" 
    end
     
    def topic
        puts "Topic - Module" 
    end
end

# Using include, extend, prepand mixin we are allowing multiple inheritance
class User
    include UserDetail 
    def add
        x = 30 + 20
        puts x
    end
end

user = User.new
user.add
user.name

class Profile
    extend UserDetail
end
Profile.age

class ProfileDetail end;
pd = ProfileDetail.new
pd.extend(UserDetail)
pd.topic

module A
 def self.included(base)
    base.extend(ClassMethods)
 end

 def hello
    "world"
 end

 module ClassMethods
    def hi
        "bye"
    end
 end
end

class Foo
 include A
end

Foo.new.hello #works
# Foo.hello #error

# Foo.new.hi #error
p Foo.hi #works

p Foo.ancestors
p Foo.singleton_class.ancestors

# Prepend
# Prepend is like include in its functionality. The only difference is where in the ancestor chain the module is added. With include, the module is added after the class in the ancestor chain. With prepend, the module is added before the class in the ancestor chain. This means ruby will look at the module to see if an instance method is defined before checking if it is defined in the class.
# This is useful if you want to wrap some logic around your methods.

module A
    def hello
        put "Log hello in module"
        super
    end
end

class Foo
    include A

    def hello
        "World"
    end
end

p Foo.new.hello
# log hello from module
# World

module IndoorPet
    def can_be_housebroken?
        true
    end
end  


class Animal 
end 

class Dog < Animal
    prepend IndoorPet
end 

class Cat < Animal
    prepend IndoorPet
end 

class Rabbit < Animal 
    prepend IndoorPet
end

roger = Rabbit.new
p roger.can_be_housebroken?

# the difference between include and prepend is related to the location in the ancestry chain where the module is placed. With prepend, the module is not inserted between the class and it's superclass as it was with include. It is actually inserted at the very bottom of the ancestry chain, as seen below.