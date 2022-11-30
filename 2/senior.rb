
class Sender
    def send(message, user)
        raise "method not implemented"
    end
end

class WhatsappSender < Sender
    def send(message, user)
        puts "#{message} - Enviando whatsapp ..."
    end
end

class EmailSender < Sender
    def send(message, user)
        puts "#{message} - Enviando Email ..."
    end
end

class SmdSender < Sender
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

user = OpenStruct.new({name: "nome"})

SendManager.new(SmdSender).send("Lorem ipsu", user)
SendManager.new(EmailSender).send("Lorem ipsu", user)
SendManager.new(WhatsappSender).send("Lorem ipsu", user)
SendManager.new(Sender).send("Lorem ipsu", user)