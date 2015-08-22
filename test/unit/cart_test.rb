require 'test_helper'

class CartTest < ActiveSupport::TestCase
  fixtures :products

  # test "the truth" do
  #   assert true
  # end

  def create_cart_with_product(product_name)
    cart = Cart.new
    cart.add_product(products(product_name).id)
    cart
  end

  def create_cart_with_products(product_names)
    cart = Cart.new
    if product_names.length > 0
      product_names.each do |product_name|
        cart.add_product(products(product_name).id)
      end
    end
    cart
  end

  test "Cart should create a new line item when adding a product" do
    cart = create_cart_with_product(:gameOfThrones)
    assert_equal 1, cart.line_items.size
  end

  test "Cart should create two line items when adding two different products" do
    cart = create_cart_with_products( [:gameOfThrones, :catsCradle] )
    assert_equal 2, cart.line_items.size
  end

  test "Cart should create only one line item when adding a product more than once" do
    cart = create_cart_with_products( [:gameOfThrones, :gameOfThrones, :gameOfThrones] )
    assert_equal 1, cart.line_items.size
  end

  test "Cart should create two line items when adding two products any number of times" do
    cart = create_cart_with_products( [:catsCradle, :catsCradle, :gameOfThrones, :gameOfThrones, :catsCradle] )
    assert_equal 2, cart.line_items.size
  end

  test "Cart should store a product's current price as a line item price when the product is added to the cart" do
    cart = create_cart_with_products( [:gameOfThrones, :catsCradle, :theNameOfTheWind] )
    cart.line_items.each do |line_item|
      assert_equal line_item.product.price, line_item.price
    end
  end
end
