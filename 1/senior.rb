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

class DefaultFormat
    def generate
        raise "We do not allow empty format"
    end
end

class Report
    def initialize(format)
        @format = format || DefaultFormat.new
    end

    def generate
        @format.generate
    end
end

Report.new(ReportJSON.new).generate
Report.new(ReportHTML.new).generate
Report.new(ReportCSV.new).generate
Report.new(ReportCSV.new).generate

Report.new(nil).generate