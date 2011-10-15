class Notifier < ActionMailer::Base
  #default :to => "contact@advicecapital.dk"

  def contact(message)
    @message = message
    mail(
      :from => @message.email,
      :to => "znowm4n@gmail.com",
      :subject => "[Contact AC]"
    )
  end
end
