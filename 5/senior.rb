class Person < ActiveRecord::Base
    attr_accessor :name, :document

    def type
        self.document.length > 11 ? "Juristic" : "Physical"
    end

    # ==== for tests =====
    # def save
    #     puts "Salvou #{self.inspect}"
    # end
end

class Client < Person
    def document=(value)
        raise "Not permited"
    end

    def cpf=(cpf)
        @document = Cpf.new(cpf).to_s
    end

    def cpf
        @document
    end
end

class Company < Person
    def document=(value)
        raise "Not permited"
    end

    def cnpj=(cnpj)
        @document = Cnpj.new(cnpj).to_s
    end

    def cnpj
        @document
    end
end

class Cnpj
    def initialize(cnpj)
        raise "CNPJ is invalid" if cnpj == "00000000000000"
        raise "CNPJ is invalid" if cnpj.length != 14
        @cnpj = cnpj
    end

    def to_s
        @cnpj
    end
end

class Cpf
    def initialize(cpf)
        raise "CPF is invalid" if cpf == "00000000000"
        raise "CPF is invalid" if cpf.length != 11
        @cpf = cpf
    end

    def to_s
        @cpf
    end
end

client = Client.new
# client.cpf = "00000000000"
# client.cpf = "0000000000"
# client.document = "00000000001"
client.cpf = "00000000001"

puts client.type
client.save

company = Company.new
# company.cnpj = "00000000000000"
# company.cnpj = "000000000000"
# company.document = "00000000000001"
company.cnpj = "00000000000001"

puts company.type
company.save


