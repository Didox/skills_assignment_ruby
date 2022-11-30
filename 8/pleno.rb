class JsonWriter 
    def self.writer
        content = '
        {
            "breakfast_menu": {
                "food": [
                    {
                        "name": "Belgian Waffles",
                        "price": "$5.95",
                        "description": "Two of our famous Belgian Waffles with plenty of real maple syrup",
                        "calories": 650
                    },
                    {
                        "name": "Strawberry Belgian Waffles",
                        "price": "$7.95",
                        "description": "Light Belgian waffles covered with strawberries and whipped cream",
                        "calories": 900
                    },
                    {
                        "name": "Berry-Berry Belgian Waffles",
                        "price": "$8.95",
                        "description": "Belgian waffles covered with assorted fresh berries and whipped cream",
                        "calories": 900
                    }
                ]
            }
        }
        '
        File.write('file.json', content)
    end
end

class XMLWriter 
    def self.writer
        content = '
        <?xml version="1.0" encoding="UTF-8"?>
        <breakfast_menu>
            <food>
                <name>Belgian Waffles</name>
                <price>$5.95</price>
                <description>
                    Two of our famous Belgian Waffles with plenty of real maple syrup
                </description>
                <calories>650</calories>
            </food>
            <food>
                <name>Strawberry Belgian Waffles</name>
                <price>$7.95</price>
                <description>
                    Light Belgian waffles covered with strawberries and whipped cream
                </description>
                <calories>900</calories>
            </food>
            <food>
                <name>Berry-Berry Belgian Waffles</name>
                <price>$8.95</price>
                <description>
                    Belgian waffles covered with assorted fresh berries and whipped cream
                </description>
                <calories>900</calories>
            </food>
        </breakfast_menu>
        '
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
        type.writer
    end
end

puts "Qual arquivo você deseja salvar?"
puts "JSON"
puts "XML"

type_writer = gets.to_s.strip.downcase.to_sym

Writer.write(type_writer)
