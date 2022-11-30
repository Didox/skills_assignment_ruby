class SendManager
    def self.send(message, user, format)
        case format.to_s
        when "email"
            puts "#{message} - Enviando Email ..."
        when "sms"
            puts "#{message} - Enviando sms ..."
        when "whatsapp"
            puts "#{message} - Enviando whatsapp ..."
        else
            raise "Format #{format} not supported"
        end
    end
end

user = {name: "nome"}
SendManager.send("Lorem ipsu", user, "email")
SendManager.send("Lorem ipsu", user, "sms")
SendManager.send("Lorem ipsu", user, "whatsapp")