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

Vehicle.new('Test', [1,2,3])
Vehicle.new(10, 12.5, {a: 'Test', b: 'Test 2'})