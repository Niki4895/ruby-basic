class ArgAccess
    def initialize(*args, **kwargs)
        @args = args
        puts "Argument length: #{@args.length}"
        argument_list
        p kwargs
    end

    def argument_list
        @args.each do |arg|
            p arg
        end
    end
end

ArgAccess.new(10, 20, "hi")
# Argument length: 3
# 10
# 20
# "hi"

ArgAccess.new(ARGV)
# ruby 4_arguments.rb 10 20 abc
# Argument length: 1
# ["10", "20", "abc"]

ArgAccess.new(name: 'Nikita')
# Argument length: 0
# {:name=>"Nikita"}

