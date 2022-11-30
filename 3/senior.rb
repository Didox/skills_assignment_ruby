class Subject
    def attach(observer)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def detach(observer)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  
    def notify
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
end
  
class SubjectImpl < Subject
    def initialize
      @observers = []
    end
  
    def attach(observer)
      @observers << observer
    end
  
    def detach(observer)
      @observers.delete(observer)
    end
  
    def notify(template)
      @observers.each { |observer| observer.send(template) }
    end
end

class Observer
    def send(template)
        raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
end

class UserObserverEmail < Observer
    def initialize(user)
        @user = user
    end

    def send(template)
        template = "===========[EMAIL - #{@user.email}]=============\n#{template}\n\n\n"
        template = template.gsub("{{name}}", @user.name)
        puts template
    end
end

class UserObserverSMS < Observer
    def initialize(user)
        @user = user
    end

    def send(template)
        template = "===========[SMS - #{@user.tel}]=============\n#{template}\n\n\n"
        template = template.gsub("{{name}}", @user.name)
        puts template
    end
end

class User
    attr_accessor :name, :email, :tel
end

user_one = User.new
user_one.name = "Jonathan"
user_one.email = "jhon@mailinator.com"
user_one.tel = "+55(11)99999-9999"

subject = SubjectImpl.new

user_observer_email = UserObserverEmail.new(user_one)
subject.attach(user_observer_email)

user_observer_email = UserObserverSMS.new(user_one)
subject.attach(user_observer_email)


subject.notify("Olá {{name}}, você está recebendo uma notificação")

subject.detach(user_observer_email)

subject.notify("Olá {{name}}, você está recebendo uma nova notificação")
