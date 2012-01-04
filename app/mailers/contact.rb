# Contact Mailer
class Contact < ActionMailer::Base
  #default :to => "contact@advicecapital.dk"

  def contact(message, sender, name)
    @message = message
    @sender = sender
    @name = name
    mail(
      :from => sender,
      :to => "znowm4n@gmail.com",
      :subject => "[Contact AC]"
    )
  end
end