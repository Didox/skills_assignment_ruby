class Action
    def initialize(tipo)
      @tipo = tipo
    end
    
    def call
        case @tipo
        when  "TIPO1"
            puts "Executa ação TIPO1"
        when "TIPO2"
            puts "Executa ação TIPO2"
        when "TIPO3"
            puts "Executa ação TIPO3"
        when "TIPO4"
            puts "Executa ação TIPO4"
        when "TIPO5"
            puts "Executa ação TIPO5"
        when "TIPO6"
            puts "Executa ação TIPO6"
        end
    end
end
   
Action.new("TIPO1").call
Action.new("TIPO2").call
Action.new("TIPO3").call
Action.new("TIPO4").call
Action.new("TIPO5").call
Action.new("TIPO6").call