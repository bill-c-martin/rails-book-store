require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
  fixtures :products

  test 'buying a product' do
    LineItem.delete_all
    Order.delete_all
    book = products(:gameOfThrones)

    # User goes to the store index page
    get '/'
    assert_response :success
    assert_template 'index'

    # User select a product, adding it to their cart
    xml_http_request :post, '/line_items', product_id: book.id
    assert_response :success
    cart = Cart.find(session[:cart_id])
    assert_equal 1, cart.line_items.size
    assert_equal book, cart.line_items[0].product

    # User checks out
    get '/orders/new'
    assert_response :success
    assert_template 'new'

    # User fills in order details on the form and submits
    post_via_redirect '/orders',
                      order: { name:        'test',
                               address:     '123 test',
                               email:       'test@test.com',
                               payment_type_id: PaymentType.find_by_name('Check').id }
    assert_response :success

    # And gets redirected to the store front
    assert_template 'index'

    # With a now-empty cart
    cart = Cart.find(session[:cart_id])
    assert_equal 0, cart.line_items.size

    # Their order was stored in the database
    orders = Order.all
    assert_equal 1, orders.size

    # All their details were captured on the order
    order = orders[0]
    assert_equal 'test',                               order.name
    assert_equal '123 test',                           order.address
    assert_equal 'test@test.com',                      order.email
    assert_equal PaymentType.find_by_name('Check').id, order.payment_type_id
    assert_equal 1, order.line_items.size

    # And the order captured the product they selected
    line_item = order.line_items[0]
    assert_equal book, line_item.product

    # An email has been sent to the user, confirming their purchase
    mail = ActionMailer::Base.deliveries.last
    assert_equal ['test@test.com'], mail.to
    assert_equal 'Bill Martin <bitterpeace@gmail.com>', mail[:from].value
    assert_equal 'Readiac Order Confirmation', mail.subject
  end
end
