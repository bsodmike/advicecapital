class NotificationsMailer < ActionMailer::Base
  #default :to => "znowm"
  #default :from =>

  def new_message(message)
    @message = message
    mail(
      :from => @message.email,
      :to => "znowm4n@gmail.com",
      :subject => "[Contact AC]"
    )
  end
end
