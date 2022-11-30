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
    def self.call(type)
        type.new.exec
    end
end

Action.call(Act1)
Action.call(Act2)
Action.call(Act3)
Action.call(Act4)
Action.call(Act5)
Action.call(Act6)