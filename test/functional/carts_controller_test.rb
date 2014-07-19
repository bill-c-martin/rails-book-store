require 'test_helper'

class CartsControllerTest < ActionController::TestCase
  setup do
    @cart = carts(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create cart' do
    assert_difference('Cart.count') do
      post :create, cart: {  }
    end

    assert_redirected_to cart_path(assigns(:cart))
  end

  test 'should show cart' do
    get :show, id: @cart
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @cart
    assert_response :success
  end

  test 'should update cart' do
    put :update, id: @cart, cart: {  }
    assert_redirected_to cart_path(assigns(:cart))
  end

  test 'should destroy cart' do
    assert_difference('Cart.count', -1) do
      delete :destroy, id: @cart
    end

    assert_redirected_to carts_path
  end

  test 'session contains no cart id by default' do
    assert_empty session[:cart_id]
  end

  test 'session contains a valid Cart object after retrieving current_cart for the first time' do
    cart = ApplicationController.current_cart
    cart_validations cart
  end

  test 'session contains a valid Cart object when retrieving current cart after it has already been created' do
    brand_new_cart = current_cart
    current_cart = current_cart
    cart_validations current_cart

  end

  def cart_validations(cart)
    assert_instance_of Cart, cart, 'current_cart returns a valid cart object when called subsequent times'
    assert_equal cart.id, session[:cart_id], 'Cart id is not the same as stored in the session'
    assert_operator cart.id, :>, 0, 'cart id is not numeric'
  end
end
