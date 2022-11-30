class Report
    def generate(format)

        case format.to_s
        when "json"
            puts "JSON generated"
        when "xml"
            puts "XML generated"
        when "html"
            puts "HTML generated"
        when "csv"
            puts "CSV generated"
        else
            raise "Format #{format} not supported"
        end

    end
end

report = Report.new
report.generate(:json)
report.generate(:xml)
report.generate(:html)
report.generate(:csv)