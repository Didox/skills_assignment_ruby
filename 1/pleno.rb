class ReportJSON
    def generate
        puts "JSON generated"
    end
end

class ReportXML
    def generate
        puts "XML generated"
    end
end

class ReportHTML
    def generate
        puts "HTML generated"
    end
end

class ReportCSV
    def generate
        puts "CSV generated"
    end
end

class Report
    GENERATORS = {
        json: ReportJSON,
        xml: ReportXML,
        html: ReportHTML,
        csv: ReportCSV
    }

    def generate(format)
        generator = GENERATORS[format]
        raise "Format #{format} not supported" unless generator
        generator.new.generate
    end
end

report = Report.new
report.generate(:json)
report.generate(:xml)
report.generate(:html)
report.generate(:csv)