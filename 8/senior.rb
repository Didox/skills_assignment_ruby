require 'byebug'

class DefaultWriter
    def writer
        raise 'not implemented'
    end

    def read_template
        format = self.class.to_s.delete("Writer").downcase
        File.read("templates/template.#{format}")
    end
end

class JsonWriter < DefaultWriter
    def writer
        content = self.read_template
        File.write('file.json', content)
    end
end

class XMLWriter < DefaultWriter
    def writer
        content = self.read_template
        File.write('file.xml', content)
    end
end

class Writer
    WRITER_TYPS = {
        json: JsonWriter,
        xml: XMLWriter,
    }

    def self.write(type_sym)
        type = WRITER_TYPS[type_sym]
        raise "type not found" unless type
        type.new.writer
    end
end

puts "Qual arquivo você deseja salvar?"
puts "JSON"
puts "XML"

type_writer = gets.to_s.strip.to_sym

Writer.write(type_writer)
