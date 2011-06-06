require 'test_helper'

class NotifierTest < ActionMailer::TestCase
<<<<<<< HEAD
  test "order_received" do
    mail = Notifier.order_received
    assert_equal "Order received", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "order_shipped" do
    mail = Notifier.order_shipped
    assert_equal "Order shipped", mail.subject
=======
  test "notification" do
    mail = Notifier.notification
    assert_equal "Notification", mail.subject
>>>>>>> 3469d2a4e2d06ad6f5f39de8d87e6553f41b892f
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
