class Notifier < ActionMailer::Base
  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
<<<<<<< HEAD
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
=======
  #   en.notifier.notification.subject
  #
  def notification
>>>>>>> 3469d2a4e2d06ad6f5f39de8d87e6553f41b892f
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
