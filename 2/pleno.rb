class WhatsappSender
    def send(message, user)
        puts "#{message} - Enviando whatsapp ..."
    end
end

class EmailSender
    def send(message, user)
        puts "#{message} - Enviando Email ..."
    end
end

class SmdSender
    def send(message, user)
        puts "#{message} - Enviando SMS ..."
    end
end

class SendManager
    def initialize(sender)
        @sender = sender
    end

    def send(message, user)
        @sender.new.send(message, user)
    end
end

user = {name: "nome"}

SendManager.new(SmdSender).send("Lorem ipsu", user)
SendManager.new(EmailSender).send("Lorem ipsu", user)
SendManager.new(WhatsappSender).send("Lorem ipsu", user)