class OrderNotifier < ActionMailer::Base
  default :from => 'Bill Martin <bitterpeace@gmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    mail :to => order.email, :subject => 'Readiac Order Confirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped
    @greeting = 'Hi'

    mail :to => 'to@example.org'
  end
end
