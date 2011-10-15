class Contact < ActionMailer::Base
  #default :to => "contact@advicecapital.dk"

  def contact(message)
    @message = message
    @sender = @message.email
    mail(
      :from => @sender,
      :to => "znowm4n@gmail.com",
      :subject => "[Contact AC]"
    )
  end
end