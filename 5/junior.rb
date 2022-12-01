class Person < ActiveRecord::Base
    attr_accessor :name, :document

    def save
        if self.document.length > 11
            raise "CNPJ is invalid" if self.document == "00000000000000"
            raise "CNPJ is invalid" if self.document.length != 14
        elsif self.document.length <= 11
            raise "CPF is invalid" if self.document == "00000000000"
            raise "CPF is invalid" if self.document.length != 11
        end

        super
        
        # for tests
        # puts "Salvou #{self.inspect}"
    end
end


client = Person.new
# client.document = "00000000000"
# client.document = "0000000000"
# client.document = "00000000001"
client.document = "00000000001"
client.save

company = Person.new
# company.document = "00000000000000"
# company.document = "000000000000"
# company.document = "00000000000001"
company.document = "00000000000001"
company.save



