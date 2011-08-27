class Notifier < ActionMailer::Base
  default :to => "contact@advicecapital.dk"

  def contact(message)
    @message = message
    mail(:from => @message.email, :subject => "[Contact AC]")  
  end

# TO BE REVIEWED #

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    
  end
  #   en.notifier.notification.subject
  #
  def notification
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
