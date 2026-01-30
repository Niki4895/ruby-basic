module A
    def a1
        p "A1"
    end

    def a2
        p "A2"
    end
end

module B
    def b1
        p "B1"
    end

    def b2
        p "B2"
    end
end

class Test
    include A
    include B

    def mixin_method
        a1
        b2
    end
end


t1 = Test.new
t1.mixin_method
t1.a2
t1.b1