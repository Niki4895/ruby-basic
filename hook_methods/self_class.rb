module Test
    class SelfMethod
        class << self
            def call(*args, **kwargs)
                p **kwargs
                p *args
                new(*args, **kwargs).call
            end
        end

        attr_reader :name, :age, :called, :errors, :result
        
        def initialize(name: , age: )
            @name = name
            @age = age
            @errors = {}
        end

        def call
            return self if @called

            @result = do_call
            @called = true

            self
        end

        def success?
            called && errors.empty?
        end

        def error_message
            errors.values.join('; ')
        end

        private

        def do_call
            if age.nil?
                errors.store(:age, "Age can't be blank")
            else
                puts "Name: #{name} and Age: #{age}"
            end
        end
    end

    class NewTest
        def initialize(name:, age:)
            @name = name
            @age = age
        end

        def print_detail
            p "Name: #{@name} and Age: #{@age}"
        end
    end
end



result = Test::SelfMethod.call(name: 'Nikita', age: 24)
p result.success?
result_1 = Test::SelfMethod.call(name: 'Nikita', age: nil)
p result_1.success?
p result_1.error_message

Test::NewTest.new(name: 'Nikita', age: '24').print_detail
Test::NewTest.new(age:'24', name: 'Nikita Test').print_detail