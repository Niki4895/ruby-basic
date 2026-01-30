# ruby passed_argument_access.rb test [1,2,3]
class Vehicle
    def initialize(*args)
        @args = args
        puts "Argument length: #{@args.length}"
        argument_list
    end

    def argument_list
        @args.each do |arg|
            p arg
        end
    end
end

Vehicle.new(*ARGV)