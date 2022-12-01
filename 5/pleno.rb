class Person < ActiveRecord::Base
    attr_accessor :name, :document

    def type
        self.document.length > 11 ? "Juristic" : "Physical"
    end
end

class Client < Person
    before_save do
        raise "CPF is invalid" if self.document == "00000000000"
        raise "CPF is invalid" if self.document.length != 11
    end
end

class Company < Person
    before_save do
        raise "CNPJ is invalid" if self.document == "00000000000000"
        raise "CNPJ is invalid" if self.document.length != 14
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


