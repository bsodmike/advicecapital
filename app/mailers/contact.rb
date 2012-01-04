# Contact Mailer
class Contact < ActionMailer::Base
  #default :to => "contact@advicecapital.dk"

  def contact(message, sender)
    @message = message
    @sender = sender
    mail(
      :from => sender,
      :to => "znowm4n@gmail.com",
      :subject => "[Contact AC]",
      :message => message
    )
  end
end