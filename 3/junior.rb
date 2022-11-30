class Sender
    def self.notify(template, type, user)
        if type == :email
            template = "===========[EMAIL - #{user.email}]=============\n#{template}\n\n\n"
            template = template.gsub("{{name}}", user.name)
        elsif type == :sms
            template = "===========[SMS - #{user.tel}]=============\n#{template}\n\n\n"
            template = template.gsub("{{name}}", user.name)
        end

        puts template
    end
end


class User
    attr_accessor :name, :email, :tel
end
users = []

user = User.new
user.name = "Jonathan"
user.email = "jhon@mailinator.com"
user.tel = "+55(11)99999-9999"

users << user

users.each do |usr|
    Sender.notify("Olá {{name}}, você está recebendo uma notificação", :email, usr)
    Sender.notify("Olá {{name}}, você está recebendo uma nova notificação", :sms, usr)
end
