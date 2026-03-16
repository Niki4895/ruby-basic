module Gfg
    
    C = 10;
  
    # Prefix with name of Module
    # module method 
    def Gfg.portal
        puts "Welcome to GFG Portal!"
    end
      
    # Prefix with the name of Module
    # module method
    def Gfg.tutorial  
        puts "Ruby Tutorial!"
    end
      
    # Prefix with the name of Module
    # module method
    def Gfg.topic  
        puts "Topic - Module"
    end
    
end

# displaying the value of 
# module constant
puts Gfg::C

# calling the methods of the module
Gfg.portal
Gfg.tutorial
Gfg.topic

p "==============================================="

# Ruby program to illustrate how 
# to use module inside a class
 
# Creating a module with name Gfg
module Gfg
    # module method 
    def portal
        puts "Welcome to GFG Portal!" 
    end
     
    # module method
    def tutorial  
        puts "Ruby Tutorial!" 
    end
     
    # module method
    def topic  
        puts "Topic - Module" 
    end
end 


# Create class
class GeeksforGeeks
 
    # Include module in class
    # by using 'include' keyword
    include Gfg
     
    # Method of the class
    def add
        x = 30 + 20
        puts x
    end
    
end
     
# Creating objects of class 
obj_class =  GeeksforGeeks.new
     
# calling module methods
# with the help of GeeksforGeeks
# class object
obj_class.portal 
obj_class.tutorial
obj_class.topic

# Calling class method 
obj_class.add

pp "========================================="

# adding module 
require "./my_module.rb"

# calling the methods of module Gfg
Gfg.portal()
Gfg.tutorial()