class Sender
    def initialize(*drivers)
        @drivers = drivers
    end

    def notify(template, user)
        @drivers.each do |driver|
            driver.new.send(template, user)
        end
    end
end

class EmailDriver
    def send(template, user)
        template = "===========[EMAIL - #{user.email}]=============\n#{template}\n\n\n"
        template = template.gsub("{{name}}", user.name)
        puts template
    end
end

class SmsDriver
    def send(template, user)
        template = "===========[SMS - #{user.tel}]=============\n#{template}\n\n\n"
        template = template.gsub("{{name}}", user.name)
        puts template
    end
end

class User
    attr_accessor :name, :email, :tel
end

user = User.new
user.name = "Jonathan"
user.email = "jhon@mailinator.com"
user.tel = "+55(11)99999-9999"

sender = Sender.new(EmailDriver,SmsDriver)
sender.notify("Olá {{name}}, você está recebendo uma notificação", user)
sender.notify("Olá {{name}}, você está recebendo uma nova notificação", user)
