require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Readiac Order Confirmation", mail.subject
    assert_equal ["bitterpeace@gmail.com"], mail.to
    assert_equal ["bitterpeace@gmail.com"], mail.from
    assert_match /1 x A Game of Thrones/, mail.body.encoded
  end

  test "shipped" do
    mail = OrderNotifier.shipped(orders(:one))
    assert_equal "Readiac Order Shipped", mail.subject
    assert_equal ["bitterpeace@gmail.com"], mail.to
    assert_equal ["bitterpeace@gmail.com"], mail.from
    assert_match /1\sx\sA Game of Thrones/, mail.body.encoded
  end

end
