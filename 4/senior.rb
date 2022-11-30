class Act1
    def exec
        puts "Executa ação TIPO1"
    end
end

class Act2
    def exec
        puts "Executa ação TIPO2"
    end
end

class Act3
    def exec
        puts "Executa ação TIPO3"
    end
end

class Act4
    def exec
        puts "Executa ação TIPO4"
    end
end

class Act5
    def exec
        puts "Executa ação TIPO5"
    end
end

class Act6
    def exec
        puts "Executa ação TIPO6"
    end
end

class Action
    def initialize(*types)
        @types = {}
        types.each do |type|
            @types[type.to_s.downcase.to_sym] = type
        end
    end

    def call(type_sym)
        type = @types[type_sym]
        raise "type (#{type_sym}) not found" unless type
        type.new.exec
    end
end

action = Action.new(Act1, Act2, Act3, Act4, Act5, Act6)
action.call(:act1)
action.call(:act2)
action.call(:act3)
action.call(:act4)
action.call(:act5)
action.call(:act6)