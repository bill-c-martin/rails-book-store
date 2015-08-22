require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  # test "the truth" do
  #   assert true
  # end
  test "Cart should create a new line item when adding a product" do
    cart = Cart.new
    cart.add_product(products(:gameOfThrones).id)
    assert_equal 1, cart.line_items.size
  end

  test "Cart should create two line items when adding two different products" do
    cart = Cart.new
    cart.add_product(products(:gameOfThrones).id)
    cart.add_product(products(:catsCradle).id)
    assert_equal 2, cart.line_items.size
  end

  test "Cart should create only one line item when adding a product more than once" do
    cart = Cart.new
    cart.add_product(products(:gameOfThrones).id)
    cart.add_product(products(:gameOfThrones).id)
    assert_equal 1, cart.line_items.size
  end

  test "Cart should create two line items when adding two products any number of times" do
    cart = Cart.new
    cart.add_product(products(:catsCradle).id)
    cart.add_product(products(:catsCradle).id)
    cart.add_product(products(:gameOfThrones).id)
    cart.add_product(products(:gameOfThrones).id)
    cart.add_product(products(:catsCradle).id)
    cart.add_product(products(:catsCradle).id)
    assert_equal 2, cart.line_items.size
  end

  test "Cart should store a product's current price as a line item price when the product is added to the cart" do
    cart = Cart.new
    cart.add_product(products(:gameOfThrones).id)
    cart.add_product(products(:catsCradle).id)
    cart.add_product(products(:theNameOfTheWind).id)
    cart.line_items.each do |line_item|
      assert_equal line_item.product.price, line_item.price
    end
  end
end
